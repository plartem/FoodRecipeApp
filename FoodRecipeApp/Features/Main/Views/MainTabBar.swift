//
//  MainTabBar.swift
//  FoodRecipeApp
//

import SFSafeSymbols
import SwiftUI

struct MainTabBar: View {
    @Binding var selectedTab: MainTab
    let newRecipeTapped: () -> Void

    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            tabItemFor(.home)
            Spacer()
            tabItemFor(.discover)
            Spacer()
            Button {
                newRecipeTapped()
            } label: {
                Image(systemSymbol: .plus)
                    .mediumStyle()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
            }
            .buttonStyle(.primaryIconCircle)
            Spacer()
            tabItemFor(.myRecipes)
            Spacer()
            tabItemFor(.profile)
            Spacer()
        }
        .padding(.horizontal, .Padding.content)
        .padding(.top, 8.0)
        .background(Asset.primaryBackground.swiftUIColor)
    }

    private func tabItemFor(_ tab: MainTab) -> some View {
        let isSelected = selectedTab == tab
        return VStack(spacing: 4.0) {
            Image(systemName: isSelected ? tab.iconSelected : tab.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
            Text(tab.text)
                .extraSmallStyle()
        }
        .foregroundColor(
            isSelected
                ? Asset.accentColor.swiftUIColor
                : Asset.tertiaryColor.swiftUIColor
        )
        .animation(.default, value: isSelected)
        .onTapGesture {
            selectedTab = tab
        }
    }
}
