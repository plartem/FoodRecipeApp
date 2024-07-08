//
//  AuthClient+Live.swift
//  FoodRecipeApp
//

import Combine
import Dependencies
import DependenciesAdditions
import FirebaseAuth
import FirebaseCore
import Foundation
import GoogleSignIn

extension AuthClient: DependencyKey {
    enum AuthError: Error, LocalizedError {
        case firebaseConfig
        case unauthorized
        case viewController
        case tokenError

        var errorDescription: String? {
            switch self {
            case .firebaseConfig: L10n.Error.Auth.firebaseConfig
            case .unauthorized: L10n.Error.Auth.unauthorized
            case .viewController: L10n.Error.Auth.viewController
            case .tokenError: L10n.Error.Auth.tokenError
            }
        }
    }

    static var liveValue: AuthClient {
        @Dependency(\.logger["FirebaseAuth"]) var logger
        let auth = Auth.auth()

        let currentUserSubject = CurrentValueSubject<BaseUser?, Never>(nil)

        return Self(
            configure: {
                auth.addStateDidChangeListener { auth, user in
                    logger.info(
                        "configure :: User state changed \(user?.uid ?? "nil", privacy: .private).")
                    currentUserSubject.send(BaseUser(from: user))
                }
            },
            currentUser: {
                currentUserSubject.value
            },
            authStream: {
                AsyncStream { continuation in
                    let cancellable = currentUserSubject.sink { continuation.yield($0) }
                    continuation.onTermination = { continuation in
                        cancellable.cancel()
                    }
                }
            },
            signUp: { email, password in
                let result = try await auth.createUser(
                    withEmail: email, password: password)
                logger.info("signUp :: User \(result.user.uid, privacy: .private) signed up.")
                return BaseUser(from: result.user)
            },
            signIn: { email, password in
                let result = try await auth.signIn(
                    withEmail: email,
                    password: password)
                logger.info("signIn :: User \(result.user.uid, privacy: .private) signed in.")
                return BaseUser(from: result.user)
            },
            sendEmailVerification: {
                guard let user = auth.currentUser else {
                    logger.error("sendEmailVerification :: User not authorized")
                    throw AuthError.unauthorized
                }
                let actionCodeSettings = ActionCodeSettings()
                actionCodeSettings.handleCodeInApp = true
                try await user.sendEmailVerification(with: actionCodeSettings)
                logger.info(
                    "sendEmailVerification :: Sent verification email for user \(user.uid, privacy: .private)"
                )
            },
            googleSignIn: { @MainActor in
                guard let clientID = FirebaseApp.app()?.options.clientID else {
                    logger.error("googleSignIn :: Couldn't get clientID")
                    throw AuthError.firebaseConfig
                }

                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config
                guard
                    let window = UIApplication.shared.keyWindows.first,
                    let rootViewController = window.rootViewController
                else {
                    throw AuthError.viewController
                }

                let userAuthentication = try await GIDSignIn.sharedInstance.signIn(
                    withPresenting: rootViewController)

                let user = userAuthentication.user
                guard let idToken = user.idToken else {
                    logger.error("googleSignIn :: Couldn't get user token")
                    throw AuthError.tokenError
                }
                let accessToken = user.accessToken

                let credential = GoogleAuthProvider.credential(
                    withIDToken: idToken.tokenString,
                    accessToken: accessToken.tokenString)

                let result = try await auth.signIn(with: credential)
                logger.info(
                    "googleSignIn :: User \(result.user.uid, privacy: .private) signed in using Google"
                )
                return BaseUser(from: result.user)
            },
            resetPassword: { email in
                try await auth.sendPasswordReset(withEmail: email)
                logger.info("resetPassword :: Reset password for \(email, privacy: .private)")
            },
            signOut: {
                try auth.signOut()
                logger.info(
                    "User \(currentUserSubject.value?.id ?? "", privacy: .private) signed out")
            }
        )
    }
}

extension BaseUser {
    init(from user: FirebaseAuth.User) {
        self.id = user.uid
        self.email = user.email ?? ""
        self.isEmailVerified = user.isEmailVerified
    }

    init?(from user: FirebaseAuth.User?) {
        guard let user else { return nil }
        self.init(from: user)
    }
}
