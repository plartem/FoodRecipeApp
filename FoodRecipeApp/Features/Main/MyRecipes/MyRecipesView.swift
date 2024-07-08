//
//  MyRecipesView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: MyRecipesFeature.self)
struct MyRecipesView: View {
    typealias Feature = MyRecipesFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        ScrollView {
            Text("MyRecipesView")
        }
    }
}

#if DEBUG
    #Preview {
        MyRecipesView(
            store: Store(initialState: MyRecipesFeature.State()) {
                MyRecipesFeature()
            })
    }
#endif
