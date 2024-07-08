//
//  HomeView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: HomeFeature.self)
struct HomeView: View {
    typealias Feature = HomeFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        NavigationStack(
            path: $store.scope(state: \.path, action: \.path)
        ) {
            ScrollView {
                VStack {
                    HStack {
                        Text("Recent recipes")
                            .subheaderStyle()
                            .bold()
                        Spacer()
                        Button {

                        } label: {
                            Image(systemSymbol: .arrowRight)
                                .mediumStyle()
                        }
                    }
                    .padding(.horizontal, .Padding.content)
                    .padding(.bottom, 8.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 12.0) {
                            ForEach(store.recentRecipes) { recipe in
                                RecipeCardView(
                                    recipe: recipe,
                                    onBookmarkTapped: {

                                    }
                                )
                                .onTapGesture {
                                    send(.recentRecipeTapped(recipe.id))
                                }
                            }
                        }
                        .padding(.horizontal, .Padding.content)
                    }
                }
                .padding(.vertical, .Padding.content)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemSymbol: .book)
                            .foregroundColor(Asset.accentColor.swiftUIColor)
                            .largeStyle()
                            .bold()
                            .padding(.horizontal, 8.0)
                        Text(L10n.App.name)
                            .largeStyle()
                            .bold()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 0.0) {
                        Button {
                            send(.notificationsTapped, animation: .default)
                        } label: {
                            Image(systemSymbol: .bell)
                                .mediumStyle()
                        }
                        .buttonStyle(.normalIcon)
                        Button {
                            send(.bookmarksTapped)
                        } label: {
                            Image(systemSymbol: .bookmark)
                                .mediumStyle()
                        }
                        .buttonStyle(.normalIcon)
                    }
                }
            }
            .background(Asset.primaryBackground.swiftUIColor)
        } destination: { store in
            switch store.case {
            case .recipeDetail(let store):
                RecipeDetailView(store: store)
            }
        }
        .task {
            await send(.task).finish()
        }
    }
}
#if DEBUG
    #Preview {
        HomeView(
            store: Store(initialState: HomeFeature.State()) {
                HomeFeature()
            })
    }
#endif
