//
//  OnboardingCookingLevelFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct OnboardingCookingLevelFeature {
    @ObservableState
    struct State: Equatable {
        let cookingLevels: IdentifiedArrayOf<CookingLevel> = [
            .novice,
            .beginner,
            .intermediate,
            .advanced,
            .professional,
        ]

        var selectedCookingLevel: CookingLevel?
        var disableProceedButton: Bool {
            selectedCookingLevel == nil
        }
    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
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
                case .proceedButtonTapped:
                    return .send(.delegate(.switchToNextStep))

                case .binding:
                    return .none
                }
            case .delegate:
                return .none
            }
        }
    }
}
