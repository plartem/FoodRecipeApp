//
//  RecipeCardView.swift
//  FoodRecipeApp
//

import NukeUI
import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    let onBookmarkTapped: () -> Void

    var body: some View {
        ZStack {
            if let previewImageURL = recipe.previews.first(where: { $0.type == .image })?.url {
                LazyImage(url: URL(string: previewImageURL)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .RecipeCardView.width, height: .RecipeCardView.height)
                    }
                }
            }

            LinearGradient(
                gradient:
                    Gradient(
                        colors: [
                            .clear,
                            .black.opacity(0.25),
                            .black.opacity(0.5),
                            .black.opacity(0.75),
                            .black.opacity(0.95),
                            .black.opacity(0.95),
                        ]),
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(spacing: 8.0) {
                HStack {
                    Spacer()
                    Button {
                        onBookmarkTapped()
                    } label: {
                        Image(systemSymbol: .bookmark)
                    }
                    .buttonStyle(.primaryIconCircle)
                }

                Spacer()
                Text(recipe.title)
                    .lineLimit(2)
                    .mediumStyle()
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    LazyImage(url: recipe.author.profilePhotoURL) { state in
                        Group {
                            if let image = state.image {
                                image
                                    .resizable()
                            } else {
                                Asset.defaultProfileImage.swiftUIImage
                                    .resizable()
                            }
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16.0, height: 16.0)
                        .clipShape(Circle())
                    }
                    Text(recipe.author.fullName)
                        .lineLimit(1)
                        .smallStyle()
                        .bold()
                    Spacer()
                }
            }
            .padding(12.0)
        }
        .foregroundStyle(.white)
        .overlay {
            RoundedRectangle(cornerRadius: .RecipeCardView.cornerRadius)
                .strokeBorder(Asset.recipeCardBorder.swiftUIColor, lineWidth: 1.0)
        }
        .frame(width: .RecipeCardView.width, height: .RecipeCardView.height)
        .clipShape(.rect(cornerRadius: .RecipeCardView.cornerRadius))
        .contentShape(.rect(cornerRadius: .RecipeCardView.cornerRadius))
    }
}

extension CGFloat {
    fileprivate enum RecipeCardView {
        static let width: CGFloat = 165.0
        static let height: CGFloat = 235.0

        static let cornerRadius: CGFloat = 24.0
    }
}

#Preview {
    VStack {
        RecipeCardView(
            recipe: Recipe.mock,
            onBookmarkTapped: {
                print("bookmark tapped")
            })
    }
}
