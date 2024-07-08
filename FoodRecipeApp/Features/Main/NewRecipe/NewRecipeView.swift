//
//  NewRecipeView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: NewRecipeFeature.self)
struct NewRecipeView: View {
    typealias Feature = NewRecipeFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        ScrollView {
            Text("NewRecipeView")
            Button("Dismiss") {
                send(.dismissTapped)
            }
        }
    }
}

#if DEBUG
    #Preview {
        NewRecipeView(
            store: Store(initialState: NewRecipeFeature.State()) {
                NewRecipeFeature()
            })
    }
#endif
