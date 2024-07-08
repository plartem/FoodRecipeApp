//
//  RemoteStorageClient.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import UIKit

@DependencyClient
struct RemoteStorageClient {
    var uploadProfileImage:
        @Sendable (
            _ image: UIImage
        ) async throws -> URL
}

extension DependencyValues {
    var remoteStorageClient: RemoteStorageClient {
        get { self[RemoteStorageClient.self] }
        set { self[RemoteStorageClient.self] = newValue }
    }
}
