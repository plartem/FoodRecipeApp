//
//  RegistrationFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import UIKit

@Reducer
struct RegistrationFeature {
    @ObservableState
    struct State: Equatable {
        var focusedField: Field?

        var email: String = ""
        var password: String = ""
        var confirmPassword: String = ""

        var showRegisteringPopup: Bool = false

        var disableProceedButton: Bool {
            email.isEmpty
                || password.isEmpty
                || confirmPassword.isEmpty
        }

        enum Field: CaseIterable, Equatable, SequentialEnum {
            case email
            case password
            case confirmPassword
        }
    }

    enum Action: ViewAction, Equatable {
        case view(View)
        case signUpFailed(String)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case task
            case backButtonTapped
            case textFieldSubmitted
            case thirdPartyAuthButtonTapped(ThirdPartyAuthProvider)
            case signUpButtonTapped
        }
    }

    @Dependency(\.databaseClient) var firebaseClient
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.logger["RegistrationFeature"]) var logger

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
                        await dismiss()
                    }

                case .textFieldSubmitted:
                    guard let field = state.focusedField else { return .none }
                    state.focusedField = field.next()
                    return state.focusedField == nil
                        ? signUp(state: &state)
                        : .none

                case .thirdPartyAuthButtonTapped(let provider):
                    state.showRegisteringPopup = true
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
                            logger.error("Third-party Auth failed: \(error)")
                            await send(.signUpFailed(error.localizedDescription))
                        }
                    }

                case .signUpButtonTapped:
                    return signUp(state: &state)

                case .binding:
                    return .none
                }

            case .signUpFailed(let error):
                state.showRegisteringPopup = false
                return .run { _ in
                    @Dependency(\.toastClient) var toastClient
                    await toastClient.addToQueue(Toast(type: .error, message: error))
                }
            }
        }
    }

    private func signUp(state: inout State) -> Effect<Action> {
        state.showRegisteringPopup = true
        return .run { [email = state.email, password = state.password] send in
            @Dependency(\.authClient.signUp) var signUp
            @Dependency(\.authClient.sendEmailVerification) var sendEmailVerification
            do {
                let _ = try await signUp(email, password)
                try await sendEmailVerification()
            } catch {
                logger.error("signUp :: Error: \(error)")
                await send(.signUpFailed(error.localizedDescription))
            }
        }
    }
}
