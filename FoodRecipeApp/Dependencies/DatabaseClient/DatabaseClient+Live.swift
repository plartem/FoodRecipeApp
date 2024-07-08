//
//  DatabaseClient+Live.swift
//  FoodRecipeApp
//

import Combine
import ComposableArchitecture
import DependenciesAdditions
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation

extension DatabaseClient: DependencyKey {
    enum DatabaseError: Error, LocalizedError {
        case unauthorized
        case decodingError
        case fetchError
        case saveError

        var errorDescription: String? {
            switch self {
            case .unauthorized: L10n.Error.Firestore.unauthorized
            case .decodingError: L10n.Error.Firestore.decodingError
            case .fetchError: L10n.Error.Firestore.fetchError
            case .saveError: L10n.Error.Firestore.saveError
            }
        }
    }

    static var liveValue: DatabaseClient {
        @Dependency(\.authClient.currentUser) var currentUser
        @Dependency(\.logger["Firestore"]) var logger
        let db = Firestore.firestore()
        let firestoreManager = FirestoreManager()
        return Self(
            isUserOnboardingNeeded: {
                guard let id = currentUser()?.id else {
                    logger.error("isUserOnboardingNeeded :: User not authorized")
                    throw DatabaseError.unauthorized
                }
                let userRef = db.collection(Collection.users).document(id)
                let userDoc = try await firestoreManager.getDocument(userRef)
                logger.info(
                    "isUserOnboardingNeeded :: Does public user info exist: \(userDoc.exists)")
                return !userDoc.exists
            },
            getCurrentUserData: {
                guard let id = currentUser()?.id else {
                    logger.error("getCurrentUserData :: User not authorized")
                    throw DatabaseError.unauthorized
                }
                let userRef = db.collection(Collection.users).document(id)
                let userPublic = try await firestoreManager.getDocument(
                    userRef, as: UserPublic.self)
                logger.info(
                    "getCurrentUserData :: User public data: \(userPublic.debugDescription)"
                )
                return userPublic
            },
            updateCurrentUserData: { userPublic in
                guard let id = currentUser()?.id else {
                    logger.error("updateCurrentUserData :: User not authorized")
                    throw DatabaseError.unauthorized
                }
                let userRef = db.collection(Collection.users).document(id)
                try await firestoreManager.setData(userPublic, for: userRef)
                logger.info(
                    "updateCurrentUserData :: Update user public data: \(userPublic.debugDescription)"
                )
            },
            getUserData: { id in
                let userRef = db.collection(Collection.users).document(id)
                let userPublic = try await firestoreManager.getDocument(
                    userRef, as: UserPublic.self)
                logger.info("getUserData :: User public data: \(userPublic.debugDescription)")
                return userPublic
            },
            getCurrentUserPrivateData: {
                guard let id = currentUser()?.id else {
                    logger.error("getCurrentUserPrivateData :: User not authorized")
                    throw DatabaseError.unauthorized
                }
                let userPrivateRef = db.collection(Collection.usersPrivate).document(id)
                let userPrivate = try await firestoreManager.getDocument(
                    userPrivateRef, as: UserPrivate.self)
                logger.info(
                    "getCurrentUserPrivateData :: User private data: \(userPrivate.debugDescription, privacy: .private)"
                )
                return userPrivate
            },
            updateCurrentUserPrivateData: { userPrivate in
                guard let id = currentUser()?.id else {
                    logger.error("updateCurrentUserPrivateData :: User not authorized")
                    throw DatabaseError.unauthorized
                }
                let userRef = db.collection(Collection.usersPrivate).document(id)
                try await firestoreManager.setData(userPrivate, for: userRef)
                logger.info(
                    "updateCurrentUserPrivateData :: User private data: \(userPrivate.debugDescription, privacy: .private)"
                )
            },
            createOrUpdateRecipe: { recipe in
                let recipeReference = db.collection(Collection.recipes).document()
                try await firestoreManager.setData(recipe, for: recipeReference)
                logger.info(
                    "createOrUpdateRecipe :: Recipe: \(recipe.debugDescription)"
                )
            },
            getRecentRecipes: {
                let recipesQuery = db.collection(Collection.recipes)
                    .order(by: Recipe.CodingKeys.createdAt.rawValue)
                    .limit(to: 5)
                let recipes = try await firestoreManager.getDocuments(recipesQuery, as: Recipe.self)
                return IdentifiedArray(uniqueElements: recipes)
            }
        )
    }
}

extension DatabaseClient {
    fileprivate class FirestoreManager {
        @Dependency(\.logger["FirestoreManager"]) var logger

        func retrieve<T: Decodable>(
            _ type: T.Type,
            from snapshot: DocumentSnapshot
        ) throws -> T {
            do {
                return try snapshot.data(as: type)
            } catch {
                logger.error("retrieve :: \(error)")
                throw DatabaseError.decodingError
            }
        }

        func getDocument(_ document: DocumentReference) async throws -> DocumentSnapshot {
            do {
                return try await document.getDocument()
            } catch {
                logger.error("getDocument :: \(error)")
                throw DatabaseError.fetchError
            }
        }

        func getDocument<T: Decodable>(
            _ document: DocumentReference,
            as type: T.Type
        ) async throws -> T {
            let snapshot = try await getDocument(document)
            return try retrieve(type, from: snapshot)
        }

        func getDocuments(
            _ query: Query
        ) async throws -> [QueryDocumentSnapshot] {
            do {
                return try await query.getDocuments().documents
            } catch {
                logger.error("getDocuments :: \(error)")
                throw DatabaseError.fetchError
            }
        }

        func getDocuments<T: Decodable>(
            _ query: Query,
            as type: T.Type
        ) async throws -> [T] {
            let snapshots = try await getDocuments(query)
            return snapshots.compactMap { snapshot in
                do {
                    return try retrieve(type, from: snapshot)
                } catch {
                    logger.error(
                        "getDocuments :: Couldn't decode Document \(snapshot.documentID) : \(error)"
                    )
                    return nil
                }
            }
        }

        func setData<T: Encodable>(
            _ data: T,
            for document: DocumentReference,
            merge: Bool = false
        ) async throws {
            do {
                let encoder = Firestore.Encoder()
                let encodedData = try encoder.encode(data)
                try await document.setData(encodedData, merge: merge)
            } catch {
                logger.error("setData :: \(error)")
                throw DatabaseError.saveError
            }
        }
    }
}

extension DatabaseClient {
    fileprivate enum Collection {
        static let users = "users"
        static let usersPrivate = "users_private"
        static let recipes = "recipes"
    }
}
