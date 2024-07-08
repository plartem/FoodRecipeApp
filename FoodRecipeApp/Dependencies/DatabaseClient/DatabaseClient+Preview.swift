//
//  DatabaseClient+Preview.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

extension DatabaseClient {
    static var previewValue: DatabaseClient {
        return Self(
            isUserOnboardingNeeded: { true },
            getCurrentUserData: { return nil },
            updateCurrentUserData: { _ in },
            getUserData: { _ in
                return nil
            },
            getCurrentUserPrivateData: { return nil },
            updateCurrentUserPrivateData: { _ in },
            createOrUpdateRecipe: { _ in },
            getRecentRecipes: { return IdentifiedArray(uniqueElements: [Recipe.mock]) }
        )
    }
}
