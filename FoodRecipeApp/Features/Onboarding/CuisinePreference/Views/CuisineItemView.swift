//
//  CuisineItemView.swift
//  FoodRecipeApp
//

import SwiftUI

struct CuisineItemView: View {
    let cuisinePreference: CuisinePreference

    var body: some View {
        VStack(spacing: 16.0) {
            Text(cuisinePreference.emoji)
                .titleStyleNoLineHeight()
            Text(cuisinePreference.name)
                .normalStyleNoLineHeight()
                .fontWeight(.bold)
        }
    }
}

#if DEBUG
    #Preview {
        VStack {
            CuisineItemView(cuisinePreference: .burger)
        }
        .padding(.Padding.content)
    }
#endif
