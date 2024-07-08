//
//  ForgotPasswordFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct ForgotPasswordFeature {
    @ObservableState
    struct State: Equatable {
        var focusedField: Field?

        var email: String = ""

        var showProcessingPopup = false

        enum Field: Equatable {
            case email
        }
    }

    enum Action: ViewAction {
        case passwordResetFailed(String)

        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case task
            case backButtonTapped
            case textFieldSubmitted
            case continueButtonTapped
        }
    }

    @Dependency(\.logger["ForgotPasswordFeature"]) var logger
    @Dependency(\.toastClient) var toastClient

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
                    return resetPassword(state: &state)

                case .continueButtonTapped:
                    return resetPassword(state: &state)

                case .binding:
                    return .none
                }

            case .passwordResetFailed(let error):
                state.showProcessingPopup = false
                return .run { _ in
                    await toastClient.addToQueue(Toast(type: .error, message: error))
                }
            }
        }
    }

    private func resetPassword(state: inout State) -> Effect<Action> {
        state.showProcessingPopup = true
        return .run { [email = state.email] send in
            @Dependency(\.authClient.resetPassword) var resetPassword
            @Dependency(\.dismiss) var dismiss
            do {
                try await resetPassword(email)
                await toastClient.addToQueue(
                    Toast(type: .success, message: "sent email"))
                await dismiss()
            } catch {
                logger.error("resetPassword :: Error: \(error)")
                await send(.passwordResetFailed(error.localizedDescription))
            }
        }
    }
}
