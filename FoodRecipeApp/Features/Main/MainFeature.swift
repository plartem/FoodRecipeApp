//
//  MainFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
struct MainFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?

        var selectedTab: MainTab = .home

        var home = HomeFeature.State()
        var discover = DiscoverFeature.State()
        var myRecipes = MyRecipesFeature.State()
        var profile = ProfileFeature.State()
    }

    enum Action: ViewAction {
        case destination(PresentationAction<Destination.Action>)

        case home(HomeFeature.Action)
        case discover(DiscoverFeature.Action)
        case myRecipes(MyRecipesFeature.Action)
        case profile(ProfileFeature.Action)

        case view(View)
        enum View: BindableAction, Equatable {
            case binding(BindingAction<State>)
            case newRecipeButtonTapped
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)

        Scope(state: \.home, action: \.home) {
            HomeFeature()
        }
        Scope(state: \.discover, action: \.discover) {
            DiscoverFeature()
        }
        Scope(state: \.myRecipes, action: \.myRecipes) {
            MyRecipesFeature()
        }
        Scope(state: \.profile, action: \.profile) {
            ProfileFeature()
        }

        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {

                case .newRecipeButtonTapped:
                    state.destination = .newRecipe(NewRecipeFeature.State())
                    return .none

                case .binding:
                    return .none
                }

            case .home, .discover, .myRecipes, .profile:
                return .none

            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

extension MainFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case newRecipe(NewRecipeFeature)
    }
}
