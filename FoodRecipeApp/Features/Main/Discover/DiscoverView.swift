//
//  DiscoverView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import SwiftUI

@ViewAction(for: DiscoverFeature.self)
struct DiscoverView: View {
    typealias Feature = DiscoverFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        ScrollView {
            VStack {
                Text("DiscoverView")
                Rectangle()
                    .background(.red)
                    .frame(width: 300, height: 450)
                Rectangle()
                    .background(.green)
                    .frame(width: 300, height: 450)
                Rectangle()
                    .background(.yellow)
                    .frame(width: 300, height: 450)
            }
        }
    }
}

#if DEBUG
    #Preview {
        DiscoverView(
            store: Store(initialState: DiscoverFeature.State()) {
                DiscoverFeature()
            })
    }
#endif
