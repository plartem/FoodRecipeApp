//
//  Gender.swift
//  FoodRecipeApp
//

import Foundation

enum Gender: String, Codable, Equatable, Identifiable {
    var id: Self { self }

    case male
    case female
    case other
}

extension Gender {
    var localized: String {
        switch self {
        case .male: L10n.Gender.male
        case .female: L10n.Gender.female
        case .other: L10n.Gender.other
        }
    }
}
