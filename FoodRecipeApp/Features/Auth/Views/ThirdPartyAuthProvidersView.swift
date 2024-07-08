//
//  ThirdPartyAuthProvidersView.swift
//  FoodRecipeApp
//

import SwiftUI

struct ThirdPartyAuthProvidersView: View {
    let tapped: (ThirdPartyAuthProvider) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12.0) {
                VStack {
                    Divider()
                        .defaultStyle()
                }
                Text(L10n.Login.ThirdPartyAuth.caption)
                    .normalStyle()
                    .primaryColor()
                    .lineLimit(1)
                    .layoutPriority(1)
                VStack {
                    Divider()
                        .defaultStyle()
                }
            }
            .padding(.bottom, .Padding.formElementBottom)

            HStack(spacing: 16.0) {
                authProvider(.google)
                authProvider(.apple)
                authProvider(.facebook)
            }
        }
    }

    @ViewBuilder
    private func authProvider(_ provider: ThirdPartyAuthProvider) -> some View {
        Button {
            tapped(provider)
        } label: {
            Image(asset: provider.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 24.0)
        }
        .buttonStyle(.normal)
    }
}

#if DEBUG
    #Preview {
        ThirdPartyAuthProvidersView(tapped: { _ in })
    }
#endif
