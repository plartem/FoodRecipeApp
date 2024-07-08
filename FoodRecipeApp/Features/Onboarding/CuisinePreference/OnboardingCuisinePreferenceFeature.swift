//
//  OnboardingCuisinePreferenceFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct OnboardingCuisinePreferenceFeature {
    @ObservableState
    struct State: Equatable {
        var isSkipped = false

        let cuisinePreferences: IdentifiedArrayOf<CuisinePreference> = [
            .salad, .egg, .soup,
            .curry, .burger, .pizza,
            .sushi, .seafood, .taco,
            .ramen, .donut, .cake,
            .cookie, .cupcake,
        ]

        var selectedCuisinePreferences: IdentifiedArrayOf<CuisinePreference> = []
        var disableProceedButton: Bool {
            selectedCuisinePreferences.isEmpty
        }
    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case skipButtonTapped
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
                case .skipButtonTapped:
                    state.isSkipped = true
                    return .send(.delegate(.switchToNextStep))

                case .proceedButtonTapped:
                    state.isSkipped = false
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
