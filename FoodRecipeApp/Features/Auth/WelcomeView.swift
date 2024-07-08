//
//  WelcomeView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SwiftUI
import SwiftUIIntrospect
import UIKit

@ViewAction(for: WelcomeFeature.self)
struct WelcomeView: View {
    typealias Feature = WelcomeFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                Group {
                    Image(asset: Asset.welcomeLogo)
                        .padding(.bottom, 16.0)
                    Text(L10n.Welcome.Header.welcome)
                        .primaryColor()
                        .headerStyle()
                        .fontWeight(.bold)
                        .padding(.bottom, 8.0)
                    Text(L10n.App.name)
                        .headerStyle()
                        .foregroundColor(Asset.accentColor.swiftUIColor)
                        .fontWeight(.bold)
                        .padding(.bottom, 16.0)
                    Text(L10n.Welcome.Header.caption)
                        .primaryColor()
                        .normalStyle()
                    Divider()
                        .defaultStyle()
                        .padding(.vertical, 32.0)
                }
                .environment(\.colorScheme, .dark)
                Button(L10n.Welcome.register) {
                    send(.registrationButtonTapped)
                }
                .buttonStyle(.primary)
                .padding(.bottom, .Padding.formElementBottom)
                Button(L10n.Welcome.login) {
                    send(.loginButtonTapped)
                }
                .buttonStyle(.normal)
                Spacer()
            }
            .padding(.horizontal, 40.0)
            .background {
                background
            }
            .statusBarHidden(true)
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .navigationDestination(
                item: $store.scope(
                    state: \.destination?.login,
                    action: \.destination.login)
            ) { store in
                LoginView(store: store)
            }
            .navigationDestination(
                item: $store.scope(
                    state: \.destination?.registration,
                    action: \.destination.registration)
            ) { store in
                RegistrationView(store: store)
            }
        }
    }

    private var background: some View {
        GeometryReader { geometry in
            Image(asset: Asset.welcomeBackground)
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height
                )
                .overlay(
                    LinearGradient(
                        gradient:
                            Gradient(
                                colors: [
                                    .black.opacity(0.5), .black,
                                ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
}

#if DEBUG
    #Preview {
        WelcomeView(
            store: Store(initialState: WelcomeFeature.State()) {
                WelcomeFeature()
            })
    }
#endif
