//
//  ProfileView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: ProfileFeature.self)
struct ProfileView: View {
    typealias Feature = ProfileFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        ScrollView {
            VStack {
                Text("ProfileView")
                Button("SIGN OUT") {
                    send(.signOut)
                }
            }
        }
    }
}

#if DEBUG
    #Preview {
        ProfileView(
            store: Store(initialState: ProfileFeature.State()) {
                ProfileFeature()
            })
    }
#endif
