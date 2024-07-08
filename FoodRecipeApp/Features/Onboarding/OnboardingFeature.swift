//
//  OnboardingFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import DependenciesAdditions
import Foundation

@Reducer
struct OnboardingFeature {
    @ObservableState
    struct State: Equatable {
        var currentStep: Step = Step.first

        var showSubmittingPopup: Bool = false

        var enableBackSwipe: Bool {
            currentStep != Step.first
        }

        var cookingLevel = OnboardingCookingLevelFeature.State()
        var cuisinePreference = OnboardingCuisinePreferenceFeature.State()
        var country = OnboardingCountrySelectionFeature.State()
        var extraInfo = OnboardingExtraInfoFeature.State()

        enum Step: Int, CaseIterable, Equatable, SequentialEnum {
            case cookingLevel = 1
            case cuisinePreference
            case country
            case extraInfo

            static let first = Step.cookingLevel

            func progress() -> Double {
                Double(self.rawValue) / Double(Step.allCases.count)
            }
        }
    }

    enum Action: ViewAction, Equatable {
        case cookingLevel(OnboardingCookingLevelFeature.Action)
        case cuisinePreference(OnboardingCuisinePreferenceFeature.Action)
        case country(OnboardingCountrySelectionFeature.Action)
        case extraInfo(OnboardingExtraInfoFeature.Action)

        case dataUpdated
        case onboardingFailed(String)

        case view(View)
        case delegate(Delegate)

        enum View: BindableAction, Equatable {
            case backButtonTapped
            case onboardingFinishedTapped
            case binding(BindingAction<State>)
        }

        enum Delegate: Equatable {
            case onboardingCompleted
        }
    }

    @Dependency(\.logger["OnboardingFeature"]) var logger

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Scope(state: \.cookingLevel, action: \.cookingLevel) {
            OnboardingCookingLevelFeature()
        }
        Scope(state: \.cuisinePreference, action: \.cuisinePreference) {
            OnboardingCuisinePreferenceFeature()
        }
        Scope(state: \.country, action: \.country) {
            OnboardingCountrySelectionFeature()
        }
        Scope(state: \.extraInfo, action: \.extraInfo) {
            OnboardingExtraInfoFeature()
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .backButtonTapped:
                    return switchStep(forward: false, state: &state)

                case .onboardingFinishedTapped:
                    return .send(.delegate(.onboardingCompleted))

                case .binding:
                    return .none
                }

            case .country(.delegate(.switchToNextStep)):
                state.extraInfo.phoneCode = "+" + (state.country.selectedCountry?.phoneCode ?? "")
                return switchStep(forward: true, state: &state)

            case .cookingLevel(.delegate(.switchToNextStep)):
                return switchStep(forward: true, state: &state)

            case .cuisinePreference(.delegate(.switchToNextStep)):
                return switchStep(forward: true, state: &state)

            case .extraInfo(.delegate(.switchToNextStep)):
                guard let gender = state.extraInfo.gender,
                    let cookingLevel = state.cookingLevel.selectedCookingLevel,
                    let country = state.country.selectedCountry
                else {
                    return .none
                }
                state.showSubmittingPopup = true
                let publicData = UserPublic(
                    username: state.extraInfo.username,
                    fullName: state.extraInfo.fullName,
                    gender: gender,
                    profilePhotoURL: nil)
                let privateData = UserPrivate(
                    country: country,
                    birthDate: state.extraInfo.datePickerSelection,
                    phoneNumber: state.extraInfo.phoneCode + state.extraInfo.phoneNumber,
                    cookingLevel: cookingLevel,
                    cuisinePreferences: !state.cuisinePreference.isSkipped
                        ? state.cuisinePreference.selectedCuisinePreferences.elements
                        : [])
                let profileImage = state.extraInfo.profileImage
                return .run { send in
                    @Dependency(\.databaseClient.updateCurrentUserData)
                    var updateCurrentUserData
                    @Dependency(\.databaseClient.updateCurrentUserPrivateData)
                    var updateCurrentUserPrivateData
                    @Dependency(\.remoteStorageClient.uploadProfileImage)
                    var uploadProfileImage

                    var userPublicData = publicData
                    do {
                        try await updateCurrentUserPrivateData(privateData)
                        if let image = profileImage {
                            let imageURL = try await uploadProfileImage(image)
                            userPublicData.profilePhotoURL = imageURL
                        }
                        try await updateCurrentUserData(userPublicData)
                        await send(.dataUpdated)
                    } catch {
                        logger.error("Error: \(error)")
                        await send(.onboardingFailed(error.localizedDescription))
                    }
                }

            case .dataUpdated:
                state.showSubmittingPopup = false
                return .send(.delegate(.onboardingCompleted))

            case .onboardingFailed(let error):
                state.showSubmittingPopup = false
                return .run { _ in
                    @Dependency(\.toastClient) var toastClient
                    await toastClient.addToQueue(Toast(type: .error, message: error))
                }

            case .cookingLevel, .cuisinePreference, .country, .extraInfo:
                return .none

            case .delegate:
                return .none
            }
        }
    }
    private func switchStep(forward: Bool, state: inout State) -> Effect<Action> {
        let step = forward ? state.currentStep.next() : state.currentStep.prev()
        if let step {
            state.currentStep = step
            logger.info("Switch to step #\(step.rawValue + 1)")
        }
        return .none
    }
}
