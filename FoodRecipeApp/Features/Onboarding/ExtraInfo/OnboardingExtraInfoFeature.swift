//
//  OnboardingExtraInfoFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import PhotosUI
import SwiftUI

@Reducer
struct OnboardingExtraInfoFeature {
    @ObservableState
    struct State: Equatable {
        var focusedField: Field?

        var profileImageItem: PhotosPickerItem?
        var username: String = ""
        var fullName: String = ""
        var phoneNumber: String = ""
        var gender: Gender?
        var birthDate: Date?
        var birthDateText: String = ""
        var datePickerSelection: Date = Date()

        var profileImage: UIImage?
        var isProfileImageLoading = false

        var phoneCode: String = ""

        var genders = [Gender.male, .female, .other]

        var birthDateRange: ClosedRange<Date> = {
            @Dependency(\.calendar) var calendar
            @Dependency(\.date.now) var now

            var startDateComponents = DateComponents()
            startDateComponents.year = 1900
            startDateComponents.month = 1
            startDateComponents.day = 1

            var endDateComponents = DateComponents()
            endDateComponents.year = -18

            if let startDate = calendar.date(from: startDateComponents),
                let endDate = calendar.date(byAdding: endDateComponents, to: now)
            {
                return startDate...endDate
            } else {
                return Date.distantPast...now
            }
        }()

        var birthDateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = DateFormatter.dateFormat(
                from: [
                    .monthDigitPadded, .dayOfMonthPadded, .yearFull,
                ])
            return dateFormatter
        }()

        var disableProceedButton: Bool {
            return username.isEmpty
                || fullName.isEmpty
                || phoneNumber.isEmpty
                || gender == nil
                || birthDate == nil
                || !birthDateRange.contains(datePickerSelection)
        }

        enum Field: CaseIterable, Equatable, SequentialEnum {
            case username
            case fullName
            case phoneNumber
            case gender
            case birthDate
        }
    }

    enum Action: ViewAction, Equatable {
        case imageLoaded(Data?)

        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case task
            case textFieldSubmitted
            case proceedButtonTapped
        }

        case delegate(Delegate)
        enum Delegate {
            case switchToNextStep
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {

            case .view(let viewAction):
                switch viewAction {
                case .task:
                    state.focusedField = nil
                    return .none

                case .binding(\.profileImageItem):
                    state.isProfileImageLoading = true
                    return .run { [state] send in
                        let data = try? await state.profileImageItem?.loadTransferable(
                            type: Data.self)
                        await send(.imageLoaded(data), animation: .default)
                    }

                case .binding(\.birthDate):
                    if let birthDate = state.birthDate {
                        state.datePickerSelection = birthDate
                    }
                    return .none

                case .binding(\.birthDateText):
                    if let birthDate = state.birthDateFormatter.date(from: state.birthDateText) {
                        state.datePickerSelection = birthDate
                        state.birthDate = birthDate
                    } else {
                        state.birthDate = nil
                    }
                    return .none

                case .binding(\.datePickerSelection):
                    state.birthDateText = state.birthDateFormatter.string(
                        from: state.datePickerSelection)
                    state.birthDate = state.datePickerSelection
                    return .none

                case .textFieldSubmitted:
                    guard let field = state.focusedField else { return .none }

                    state.focusedField = field.next()
                    return state.focusedField == nil
                        ? .send(.delegate(.switchToNextStep))
                        : .none

                case .proceedButtonTapped:
                    return .send(.delegate(.switchToNextStep))

                case .binding:
                    return .none
                }

            case .imageLoaded(let data):
                if let data, let image = UIImage(data: data) {
                    state.profileImage = image
                } else {
                    state.profileImage = nil
                }
                state.isProfileImageLoading = false
                return .none

            case .delegate:
                return .none
            }
        }
    }
}
