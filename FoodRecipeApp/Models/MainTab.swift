//
//  MainTab.swift
//  FoodRecipeApp
//

import Foundation

enum MainTab: CaseIterable, Equatable {
    case home
    case discover
    case myRecipes
    case profile

    var text: String {
        switch self {
        case .home: L10n.MainTab.home
        case .discover: L10n.MainTab.discover
        case .myRecipes: L10n.MainTab.myRecipes
        case .profile: L10n.MainTab.profile
        }
    }

    var icon: String {
        switch self {
        case .home: "house"
        case .discover: "location.circle"
        case .myRecipes: "doc.text"
        case .profile: "person"
        }
    }

    var iconSelected: String {
        switch self {
        case .home: "house.fill"
        case .discover: "location.circle.fill"
        case .myRecipes: "doc.text.fill"
        case .profile: "person.fill"
        }
    }
}
