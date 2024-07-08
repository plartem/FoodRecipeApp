//
//  SplashView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Spacer()
            Image(systemSymbol: .book)
                .foregroundColor(Asset.accentColor.swiftUIColor)
                .font(.urbanist(size: 100.0))
                .padding(32.0)
            Text(L10n.App.name)
                .primaryColor()
                .titleStyle()
                .fontWeight(.bold)
            Spacer()
            ActivityIndicator()
                .frame(
                    width: 100.0,
                    height: 100.0
                )
                .padding(64.0)
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#if DEBUG
    #Preview {
        SplashView()
    }
#endif
