//
//  OnboardingView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SwiftUI

@ViewAction(for: OnboardingFeature.self)
struct OnboardingView: View {
    typealias Feature = OnboardingFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    BackSymbolButton {
                        send(
                            .backButtonTapped,
                            animation: .default
                        )
                    }
                    .opacity(store.enableBackSwipe ? 1.0 : 0.0)
                    HStack {
                        Spacer()
                        ProgressView(
                            value: store.currentStep.progress()
                        )
                        .progressViewStyle(ProgressBarStyle())
                        .frame(
                            width: geometry.size.width / 2
                        )
                        Spacer()
                    }
                }
                .padding(.horizontal, 16.0)
            }
            .frame(height: 30)

            TabView(selection: $store.currentStep) {
                OnboardingCookingLevelView(
                    store: store.scope(
                        state: \.cookingLevel,
                        action: \.cookingLevel
                    )
                )
                .tag(Feature.State.Step.cookingLevel)

                OnboardingCuisinePreferenceView(
                    store: store.scope(
                        state: \.cuisinePreference,
                        action: \.cuisinePreference
                    )
                )
                .tag(Feature.State.Step.cuisinePreference)

                OnboardingCountrySelectionView(
                    store: store.scope(
                        state: \.country,
                        action: \.country
                    )
                )
                .tag(Feature.State.Step.country)

                OnboardingExtraInfoView(
                    store: store.scope(
                        state: \.extraInfo,
                        action: \.extraInfo
                    )
                )
                .tag(Feature.State.Step.extraInfo)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .tabViewDisableSwipe()
            .animation(.default, value: store.currentStep)
        }
        .loadingPopup(
            isPresented: $store.showSubmittingPopup,
            message: L10n.Onboarding.Popup.Message.saving
        )
    }
}

#if DEBUG
    #Preview {
        struct PreviewTestError: LocalizedError {
            let description: String

            var errorDescription: String? { description }
        }
        return OnboardingView(
            store: Store(initialState: OnboardingFeature.State()) {
                OnboardingFeature()
                    ._printChanges()
            } withDependencies: {
                $0.databaseClient.updateCurrentUserData = { _ in
                    throw PreviewTestError(description: "Test error 11231")
                }
            })
    }
#endif
