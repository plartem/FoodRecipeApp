//
//  AuthClient+Preview.swift
//  FoodRecipeApp
//

import Foundation

extension AuthClient {
    static var previewValue: AuthClient {
        return Self(
            configure: {},
            currentUser: { nil },
            authStream: { .never },
            signUp: { email, _ in
                return BaseUser(id: UUID().uuidString, email: email, isEmailVerified: true)
            },
            signIn: { email, _ in
                return BaseUser(id: UUID().uuidString, email: email, isEmailVerified: true)
            },
            sendEmailVerification: {},
            googleSignIn: {
                return BaseUser(
                    id: UUID().uuidString, email: "test@gmail.com", isEmailVerified: true)
            },
            resetPassword: { _ in },
            signOut: {})
    }
}
