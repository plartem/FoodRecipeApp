//
//  ProfileFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct ProfileFeature {
    @ObservableState
    struct State: Equatable {

    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case signOut
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .signOut:
                    return .run { _ in
                        @Dependency(\.authClient.signOut) var signOut
                        do {
                            try signOut()
                        } catch {
                            @Dependency(\.toastClient) var toastClient
                            await toastClient.addToQueue(
                                Toast(
                                    type: .error,
                                    message: error.localizedDescription))
                        }
                    }

                case .binding:
                    return .none
                }
            }
        }
    }
}
