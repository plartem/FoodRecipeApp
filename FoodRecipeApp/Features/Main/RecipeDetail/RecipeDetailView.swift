//
//  RecipeDetailView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: RecipeDetailFeature.self)
struct RecipeDetailView: View {
    typealias Feature = RecipeDetailFeature
    let store: StoreOf<Feature>

    var body: some View {
        ScrollView {
            VStack {
                Text(store.recipe.title)
                    .subheaderStyle()
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Rectangle()
                    .fill(.green)
                    .frame(width: 300, height: 450)
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 300, height: 450)
            }
            .padding(.Padding.content)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    BackSymbolButton {
                        send(.backButtonTapped)
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image(systemSymbol: .bookmark)
                            .mediumStyle()
                    }
                    .buttonStyle(.normalIcon)
                    Button {
                    } label: {
                        Image(systemSymbol: .paperplane)
                            .mediumStyle()
                    }
                    .buttonStyle(.normalIcon)
                    Button {
                    } label: {
                        Image(systemSymbol: .ellipsisCircle)
                            .mediumStyle()
                    }
                    .buttonStyle(.normalIcon)
                }

            }
        }
        .background(Asset.primaryBackground.swiftUIColor)
    }
}
