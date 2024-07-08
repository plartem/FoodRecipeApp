//
//  RemoteStorageClient+Live.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import DependenciesAdditions
import FirebaseStorage
import Foundation

extension RemoteStorageClient: DependencyKey {
    enum RemoteStorageError: Error, LocalizedError {
        case unauthorized
        case fileReadingError
        case fileUploadingError

        var errorDescription: String? {
            switch self {
            case .unauthorized: L10n.Error.Storage.unauthorized
            case .fileReadingError: L10n.Error.Storage.fileReadingError
            case .fileUploadingError: L10n.Error.Storage.fileUploadingError
            }
        }
    }

    static var liveValue: RemoteStorageClient {
        let storageManager = FirebaseStorageManager()
        @Dependency(\.authClient.currentUser) var currentUser
        @Dependency(\.logger["FirebaseStorage"]) var logger
        return Self(
            uploadProfileImage: { image in
                guard let userId = currentUser()?.id else {
                    logger.error("uploadProfileImage :: User not authorized")
                    throw RemoteStorageError.unauthorized
                }
                guard let data = image.pngData() else {
                    logger.error("uploadProfileImage :: Error getting pngData from image")
                    throw RemoteStorageError.fileReadingError
                }

                let url = try await storageManager.uploadFileData(
                    fileData: data,
                    path: .profileImage(id: userId),
                    onProgress: nil)
                logger.info(
                    "uploadProfileImage :: Uploaded profile picture \(url, privacy: .private)")
                return url
            }
        )
    }
}

extension RemoteStorageClient {
    fileprivate actor FirebaseStorageManager {
        @Dependency(\.logger["FirebaseStorage"]) var logger
        private let storageRef = Storage.storage().reference()

        func uploadFileData(
            fileData: Data,
            path: FilePath,
            onProgress: ((Progress?) -> Void)?
        ) async throws -> URL {
            let fileRef = self.storageRef.child(path.firebaseStoragePath)
            let metadata = StorageMetadata()
            metadata.contentType = path.contentType
            do {
                let _ = try await fileRef.putDataAsync(
                    fileData,
                    metadata: metadata,
                    onProgress: onProgress)
                let resultURL = try await fileRef.downloadURL()
                return resultURL
            } catch {
                logger.error("uploadFileData :: \(error)")
                throw RemoteStorageError.fileUploadingError
            }
        }

        func uploadFileFromURL(
            url: URL,
            path: FilePath,
            onProgress: ((Progress?) -> Void)?
        ) async throws -> URL {
            let fileRef = self.storageRef.child(path.firebaseStoragePath)
            let metadata = StorageMetadata()
            metadata.contentType = path.contentType
            do {
                let _ = try await fileRef.putFileAsync(
                    from: url,
                    metadata: metadata,
                    onProgress: onProgress)
                let resultURL = try await fileRef.downloadURL()
                return resultURL
            } catch {
                logger.error("uploadFileFromURL :: \(error)")
                throw RemoteStorageError.fileUploadingError
            }
        }

        enum FilePath {
            case profileImage(id: String)

            var firebaseStoragePath: String {
                switch self {
                case .profileImage(let id): "/profile/\(id)/profile.png"
                }
            }

            var contentType: String {
                switch self {
                case .profileImage: "image/png"
                }
            }
        }
    }
}
