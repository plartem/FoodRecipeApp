//
//  ContentFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import FirebaseCore
import Foundation
import SwiftUI

@Reducer
struct ContentFeature {
    @ObservableState
    struct State: Equatable {
        var appDelegate: AppDelegateFeature.State = .init()
        var destination: Destination.State = .splash

        var toast: Toast?
    }

    enum Action: ViewAction {
        case userStateUpdated(BaseUser?, showOnboarding: Bool)
        case showToast(Toast?)
        case appDelegate(AppDelegateFeature.Action)
        case destination(Destination.Action)

        case view(View)
        enum View: BindableAction, Equatable {
            case task
            case toastDismissed
            case binding(BindingAction<State>)
        }
    }

    @Dependency(\.logger["ContentFeature"]) var logger
    @Dependency(\.toastClient) var toastClient

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Scope(state: \.appDelegate, action: \.appDelegate) {
            AppDelegateFeature()
        }
        Scope(state: \.destination, action: \.destination) {
            Destination.body
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .task:
                    logger.info("task :: View appeared")
                    return .run { send in
                        await withThrowingTaskGroup(of: Void.self) { group in
                            group.addTask {
                                @Dependency(\.authClient.authStream) var authStream
                                @Dependency(\.databaseClient.isUserOnboardingNeeded)
                                var isUserOnboardingNeeded
                                for await user in authStream() {
                                    if let user {
                                        do {
                                            let showOnboarding = try await isUserOnboardingNeeded()
                                            await send(
                                                .userStateUpdated(
                                                    user, showOnboarding: showOnboarding))
                                        } catch {
                                            logger.error(
                                                "task :: isUserOnboardingNeeded error: \(error.localizedDescription)"
                                            )
                                            await toastClient.addToQueue(
                                                Toast(
                                                    type: .error,
                                                    message: error.localizedDescription
                                                ))
                                            await send(
                                                .userStateUpdated(user, showOnboarding: false))
                                        }
                                    } else {
                                        await send(.userStateUpdated(nil, showOnboarding: false))
                                    }
                                }
                            }

                            group.addTask {
                                for await toast in await toastClient.observe() {
                                    await send(.showToast(toast))
                                }
                            }
                        }
                    }

                case .toastDismissed:
                    return .run { _ in
                        await self.toastClient.dismiss()
                    }

                case .binding:
                    return .none
                }

            case .userStateUpdated(let user, let showOnboarding):
                logger.info(
                    "userStateUpdated :: User: \(user?.id ?? "nil", privacy: .private) showOnboarding: \(showOnboarding)"
                )
                if user != nil {
                    state.destination =
                        showOnboarding
                        ? .onboarding(OnboardingFeature.State())
                        : .main(MainFeature.State())
                } else {
                    state.destination = .auth(WelcomeFeature.State())
                }
                return .none

            case .showToast(let toast):
                logger.info("showToast :: \(toast?.debugDescription ?? "nil", privacy: .private)")
                state.toast = toast
                return .none

            case .destination(.onboarding(.delegate(.onboardingCompleted))):
                state.destination = .main(MainFeature.State())
                return .none

            case .appDelegate(.didFinishLaunching):
                logger.info("appDelegate :: didFinishLaunching")
                @Dependency(\.firebaseClient.configure) var configureFirebase
                @Dependency(\.authClient.configure) var configureAuth
                configureFirebase()
                configureAuth()
                return .none

            case .destination:
                return .none

            case .appDelegate:
                return .none
            }
        }
    }
}

extension ContentFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case splash
        case auth(WelcomeFeature)
        case onboarding(OnboardingFeature)
        case main(MainFeature)
    }
}
