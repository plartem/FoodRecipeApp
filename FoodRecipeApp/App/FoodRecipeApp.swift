//
//  FoodRecipeApp.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(
        initialState: ContentFeature.State(),
        reducer: {
            ContentFeature()
        })

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        store.send(.appDelegate(.didFinishLaunching))
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct FoodRecipeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView(store: appDelegate.store)
                .background(.red, ignoresSafeAreaEdges: .all)
                .task {
                    UIApplication.shared.hideKeyboardOnTappedAround()
                }
        }
    }
}
