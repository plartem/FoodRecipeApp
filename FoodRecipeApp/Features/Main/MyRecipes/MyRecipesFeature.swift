//
//  MyRecipesFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct MyRecipesFeature {
    @ObservableState
    struct State: Equatable {

    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .binding:
                    return .none
                }
            }
        }
    }
}
