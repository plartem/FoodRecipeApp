//
//  MainView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI
import SwiftUIIntrospect

@ViewAction(for: MainFeature.self)
struct MainView: View {
    typealias Feature = MainFeature
    @Bindable var store: StoreOf<Feature>

    @State var isForward = true

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $store.selectedTab) {
                HomeView(
                    store: store.scope(
                        state: \.home,
                        action: \.home
                    )
                )
                .tag(MainTab.home)

                DiscoverView(
                    store: store.scope(
                        state: \.discover,
                        action: \.discover
                    )
                )
                .tag(MainTab.discover)

                MyRecipesView(
                    store: store.scope(
                        state: \.myRecipes,
                        action: \.myRecipes
                    )
                )
                .tag(MainTab.myRecipes)

                ProfileView(
                    store: store.scope(
                        state: \.profile,
                        action: \.profile
                    )
                )
                .tag(MainTab.profile)
            }
            .tabViewHideTabBar()
            .tabViewDisableSwipe()

            MainTabBar(
                selectedTab: $store.selectedTab,
                newRecipeTapped: {
                    send(.newRecipeButtonTapped)
                })
        }
        .fullScreenCover(
            item: $store.scope(
                state: \.destination?.newRecipe,
                action: \.destination.newRecipe)
        ) { store in
            NewRecipeView(store: store)
        }
    }
}

#if DEBUG
    #Preview {
        MainView(
            store: Store(initialState: MainFeature.State()) {
                MainFeature()
            })
    }
#endif
