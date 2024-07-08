//
//  FirebaseClient.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import DependenciesAdditions
import FirebaseCore
import Foundation

@DependencyClient
struct FirebaseClient {
    var configure: @Sendable () -> Void
}

extension FirebaseClient: DependencyKey {
    static var liveValue: FirebaseClient {
        @Dependency(\.logger["Firebase"]) var logger
        return Self(
            configure: {
                logger.info("Configure")
                FirebaseApp.configure()
            }
        )
    }

    static var previewValue: FirebaseClient {
        return Self(configure: {})
    }
}

extension DependencyValues {
    var firebaseClient: FirebaseClient {
        get { self[FirebaseClient.self] }
        set { self[FirebaseClient.self] = newValue }
    }
}
