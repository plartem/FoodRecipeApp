//
//  LoginFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct LoginFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?

        var focusedField: Field?

        var email: String = ""
        var password: String = ""

        var showLoginPopup = false

        enum Field: CaseIterable, Equatable, SequentialEnum {
            case email
            case password
        }
    }

    enum Action: ViewAction {
        case destination(PresentationAction<Destination.Action>)
        case loginFailed(String)

        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case task
            case backButtonTapped
            case textFieldSubmitted
            case forgotPasswordButtonTapped
            case thirdPartyAuthButtonTapped(ThirdPartyAuthProvider)
            case signInButtonTapped
        }
    }

    @Dependency(\.logger["LoginFeature"]) var logger

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .task:
                    state.focusedField = nil
                    return .none

                case .backButtonTapped:
                    return .run { _ in
                        @Dependency(\.dismiss) var dismiss
                        await dismiss()
                    }

                case .textFieldSubmitted:
                    guard let field = state.focusedField else { return .none }

                    state.focusedField = field.next()

                    return state.focusedField == nil
                        ? signIn(state: &state)
                        : .none

                case .forgotPasswordButtonTapped:
                    state.destination = .forgotPassword(
                        ForgotPasswordFeature.State(email: state.email))
                    return .none

                case .thirdPartyAuthButtonTapped(let provider):
                    state.showLoginPopup = true
                    return .run { send in
                        do {
                            switch provider {
                            case .google:
                                @Dependency(\.authClient.googleSignIn) var googleSignIn
                                _ = try await googleSignIn()
                            case .apple:
                                break
                            case .facebook:
                                break
                            }
                        } catch {
                            await send(.loginFailed(error.localizedDescription))
                        }
                    }

                case .signInButtonTapped:
                    return signIn(state: &state)

                case .binding:
                    return .none
                }

            case .loginFailed(let error):
                state.showLoginPopup = false
                return .run { _ in
                    @Dependency(\.toastClient) var toastClient
                    await toastClient.addToQueue(Toast(type: .error, message: error))
                }

            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }

    private func signIn(state: inout State) -> Effect<Action> {
        state.showLoginPopup = true
        return .run { [email = state.email, password = state.password] send in
            do {
                @Dependency(\.authClient.signIn) var signIn
                _ = try await signIn(email, password)
            } catch {
                logger.error("signIn :: Error: \(error)")
                await send(.loginFailed(error.localizedDescription))
            }
        }
    }
}

extension LoginFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case forgotPassword(ForgotPasswordFeature)
    }
}
