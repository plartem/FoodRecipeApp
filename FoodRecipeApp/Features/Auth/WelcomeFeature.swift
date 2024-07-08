//
//  WelcomeFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct WelcomeFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?
    }

    enum Action: ViewAction {
        case destination(PresentationAction<Destination.Action>)

        case view(View)
        enum View: Equatable {
            case loginButtonTapped
            case registrationButtonTapped
        }
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .loginButtonTapped:
                    state.destination = .login(LoginFeature.State())
                    return .none

                case .registrationButtonTapped:
                    state.destination = .registration(RegistrationFeature.State())
                    return .none
                }

            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

extension WelcomeFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case login(LoginFeature)
        case registration(RegistrationFeature)
    }
}
