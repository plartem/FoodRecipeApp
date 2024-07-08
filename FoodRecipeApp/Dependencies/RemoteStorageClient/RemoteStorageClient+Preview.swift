//
//  RemoteStorageClient+Preview.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

extension RemoteStorageClient {
    static var previewValue: RemoteStorageClient {
        @Dependency(\.continuousClock) var clock
        return Self(
            uploadProfileImage: { _ in
                try? await clock.sleep(for: .seconds(1.0))
                return URL(string: "https://picsum.photos/id/237/200/300")!
            }
        )
    }
}
