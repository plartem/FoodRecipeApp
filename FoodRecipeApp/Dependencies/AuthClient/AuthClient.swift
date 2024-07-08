//
//  AuthClient.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct AuthClient {
    var configure: @Sendable () -> Void
    var currentUser: @Sendable () -> BaseUser?
    var authStream: @Sendable () -> AsyncStream<BaseUser?> = { .never }
    var signUp:
        @Sendable (
            _ email: String,
            _ password: String
        ) async throws -> BaseUser
    var signIn:
        @Sendable (
            _ email: String,
            _ password: String
        ) async throws -> BaseUser
    var sendEmailVerification: @Sendable () async throws -> Void
    var googleSignIn: @Sendable () async throws -> BaseUser
    var resetPassword: @Sendable (String) async throws -> Void
    var signOut: @Sendable () throws -> Void
}

extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
