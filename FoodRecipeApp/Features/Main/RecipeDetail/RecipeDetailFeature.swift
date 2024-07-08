//
//  RecipeDetailFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct RecipeDetailFeature {
    @ObservableState
    struct State: Equatable {
        var recipe: Recipe
    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case backButtonTapped
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .backButtonTapped:
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
