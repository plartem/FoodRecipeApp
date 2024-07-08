//
//  ToastClient.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct ToastClient {
    var observe: @Sendable () async -> AsyncStream<Toast?> = { .never }
    var addToQueue: @Sendable (Toast) async -> Void
    var dismiss: @Sendable () async -> Void
}

extension DependencyValues {
    var toastClient: ToastClient {
        get { self[ToastClient.self] }
        set { self[ToastClient.self] = newValue }
    }
}
