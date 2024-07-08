//
//  CuisinePreference.swift
//  FoodRecipeApp
//

import Foundation

enum CuisinePreference: String, Codable, Identifiable {
    var id: Self { self }

    case salad
    case egg
    case soup
    case curry
    case burger
    case pizza
    case sushi
    case seafood
    case taco
    case ramen
    case donut
    case cake
    case cookie
    case cupcake

    var emoji: String {
        switch self {
        case .salad: "🥗"
        case .egg: "🥚"
        case .soup: "🍲"
        case .curry: "🍛"
        case .burger: "🍔"
        case .pizza: "🍕"
        case .sushi: "🍣"
        case .seafood: "🦐"
        case .taco: "🌮"
        case .ramen: "🍜"
        case .donut: "🍩"
        case .cake: "🍰"
        case .cookie: "🍪"
        case .cupcake: "🧁"
        }
    }

    var name: String {
        switch self {
        case .salad: L10n.CookingPreference.Salad.name
        case .egg: L10n.CookingPreference.Egg.name
        case .soup: L10n.CookingPreference.Soup.name
        case .curry: L10n.CookingPreference.Curry.name
        case .burger: L10n.CookingPreference.Burger.name
        case .pizza: L10n.CookingPreference.Pizza.name
        case .sushi: L10n.CookingPreference.Sushi.name
        case .seafood: L10n.CookingPreference.Seafood.name
        case .taco: L10n.CookingPreference.Taco.name
        case .ramen: L10n.CookingPreference.Ramen.name
        case .donut: L10n.CookingPreference.Donut.name
        case .cake: L10n.CookingPreference.Cake.name
        case .cookie: L10n.CookingPreference.Cookie.name
        case .cupcake: L10n.CookingPreference.Cupcake.name
        }
    }

}
