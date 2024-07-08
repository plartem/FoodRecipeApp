//
//  DatabaseClient.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct DatabaseClient {
    var isUserOnboardingNeeded: @Sendable () async throws -> Bool = { false }
    // PublicUserData
    var getCurrentUserData: @Sendable () async throws -> UserPublic?
    var updateCurrentUserData: @Sendable (UserPublic) async throws -> Void
    var getUserData: @Sendable (_ id: String) async throws -> UserPublic?
    // PrivateUserData
    var getCurrentUserPrivateData: @Sendable () async throws -> UserPrivate?
    var updateCurrentUserPrivateData: @Sendable (UserPrivate) async throws -> Void
    // Recipes
    var createOrUpdateRecipe: @Sendable (Recipe) async throws -> Void
    var getRecentRecipes: @Sendable () async throws -> IdentifiedArrayOf<Recipe>
}

extension DependencyValues {
    var databaseClient: DatabaseClient {
        get { self[DatabaseClient.self] }
        set { self[DatabaseClient.self] = newValue }
    }
}
