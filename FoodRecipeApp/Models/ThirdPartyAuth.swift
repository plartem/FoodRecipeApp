//
//  ThirdPartyAuth.swift
//  FoodRecipeApp
//

import Foundation

enum ThirdPartyAuthProvider {
    case apple
    case google
    case facebook

    var icon: ImageAsset {
        switch self {
        case .apple:
            Asset.AuthProvider.apple
        case .google:
            Asset.AuthProvider.google
        case .facebook:
            Asset.AuthProvider.facebook
        }
    }
}
