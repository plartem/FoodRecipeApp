//
//  ContentView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SFSafeSymbols
import SwiftUI

@ViewAction(for: ContentFeature.self)
struct ContentView: View {
    typealias Feature = ContentFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        Group {
            let destinationStore = store.scope(
                state: \.destination,
                action: \.destination
            )
            switch destinationStore.case {
            case .splash:
                SplashView()

            case .auth(let store):
                WelcomeView(store: store)

            case .onboarding(let store):
                OnboardingView(store: store)

            case .main(let store):
                MainView(store: store)
            }
        }
        .transition(.opacity)
        .animation(.default, value: store.destination)
        .task {
            try? await Task.sleep(for: .seconds(1))
            await send(.task).finish()
        }
        .popup(item: $store.toast) { toast in
            HStack {
                Image(systemSymbol: toast.icon)
                    .largeStyle()
                Text(toast.message)
                    .multilineTextAlignment(.center)
                    .normalStyle()
                    .bold()
            }
            .foregroundStyle(toast.foregroundColor)
            .padding(16.0)
            .background(toast.backgroundColor)
            .clipShape(.rect(cornerRadius: 16.0))
            .overlay {
                RoundedRectangle(
                    cornerRadius: 16.0
                )
                .strokeBorder(Asset.accentColor.swiftUIColor)
            }
            .padding(.Padding.content)
        } customize: {
            $0
                .type(
                    .floater(
                        verticalPadding: 0.0,
                        horizontalPadding: 0.0,
                        useSafeAreaInset: true)
                )
                .position(.top)
                .closeOnTap(true)
                .closeOnTapOutside(false)
                .dragToDismiss(true)
                .animation(.default)
                .autohideIn(3.0)
                .dismissCallback {
                    send(.toastDismissed)
                }
        }
        .background(Asset.primaryBackground.swiftUIColor, ignoresSafeAreaEdges: .all)
    }
}

#if DEBUG
    #Preview {
        ContentView(
            store: Store(initialState: ContentFeature.State()) {
                ContentFeature()
            } withDependencies: {
                $0.authClient.authStream = { .never }
            }
        )
    }
#endif
