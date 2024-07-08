//
//  TabView+disableSwipe.swift
//  FoodRecipeApp
//

import Foundation
import SwiftUI
import SwiftUIIntrospect

extension View {
    func tabViewDisableSwipe() -> some View {
        modifier(TabViewDisableSwipeModifier())
    }

    func tabViewHideTabBar() -> some View {
        modifier(TabViewHideTabBar())
    }
}

struct TabViewDisableSwipeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .introspect(.tabView(style: .page), on: .iOS(.v16, .v17)) { collectionView in
                // disable swipe
                collectionView.isScrollEnabled = false
                // fix clipped subview's shadows
                collectionView.clipsToBounds = false
            }
    }
}

struct TabViewHideTabBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            // using .tabViewStyle(.page(indexDisplayMode: .never) with NavigationStack leads to UI bugs
            .introspect(.tabView, on: .iOS(.v16, .v17)) { tabView in
                tabView.tabBar.isHidden = true
            }
    }
}
