//
//  CookingLevel.swift
//  FoodRecipeApp
//

import Foundation

enum CookingLevel: String, Codable, Equatable, Identifiable {
    var id: Self { self }

    case novice
    case beginner
    case intermediate
    case advanced
    case professional
}

extension CookingLevel {
    var name: String {
        switch self {
        case .advanced: L10n.CookingLevel.Advanced.name
        case .beginner: L10n.CookingLevel.Beginner.name
        case .intermediate: L10n.CookingLevel.Intermediate.name
        case .novice: L10n.CookingLevel.Novice.name
        case .professional: L10n.CookingLevel.Professional.name
        }
    }

    var description: String {
        switch self {
        case .advanced: L10n.CookingLevel.Advanced.description
        case .beginner: L10n.CookingLevel.Beginner.description
        case .intermediate: L10n.CookingLevel.Intermediate.description
        case .novice: L10n.CookingLevel.Novice.description
        case .professional: L10n.CookingLevel.Professional.description
        }
    }
}
