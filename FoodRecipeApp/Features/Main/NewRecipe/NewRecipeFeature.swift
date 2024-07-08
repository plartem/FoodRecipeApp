//
//  NewRecipeFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct NewRecipeFeature {
    @ObservableState
    struct State: Equatable {

    }

    enum Action: ViewAction {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case dismissTapped
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .dismissTapped:
                    return .run { _ in
                        @Dependency(\.dismiss) var dismiss
                        await dismiss()
                    }
                case .binding:
                    return .none
                }
            }
        }
    }
}
