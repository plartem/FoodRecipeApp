//
//  HomeFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct HomeFeature {
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
        var recentRecipes = IdentifiedArrayOf<Recipe>()
    }

    enum Action: ViewAction {
        case path(StackActionOf<Path>)

        case recentRecipesReady(IdentifiedArrayOf<Recipe>)

        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case task
            case notificationsTapped
            case bookmarksTapped
            case recentRecipeTapped(Recipe.ID)
        }
    }

    @Dependency(\.logger["HomeFeature"]) var logger
    @Dependency(\.toastClient) var toastClient

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .task:
                    return .run { send in
                        @Dependency(\.databaseClient.getRecentRecipes) var getRecentRecipes
                        do {
                            let recipes = try await getRecentRecipes()
                            await send(.recentRecipesReady(recipes))
                        } catch {
                            await toastClient.addToQueue(
                                Toast(
                                    type: .error,
                                    message: error.localizedDescription
                                ))
                        }
                    }

                case .notificationsTapped:
                    return .none

                case .bookmarksTapped:
                    return .none

                case .recentRecipeTapped(let id):
                    guard let recipe = state.recentRecipes[id: id] else { return .none }

                    state.path.append(
                        .recipeDetail(RecipeDetailFeature.State(recipe: recipe)))
                    return .none

                case .binding:
                    return .none
                }

            case .recentRecipesReady(let recipes):
                state.recentRecipes = recipes
                return .none

            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

extension HomeFeature {
    @Reducer(state: .equatable)
    enum Path {
        case recipeDetail(RecipeDetailFeature)
    }
}
