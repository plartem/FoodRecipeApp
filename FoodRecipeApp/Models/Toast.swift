//
//  Toast.swift
//  FoodRecipeApp
//

import Foundation
import SFSafeSymbols
import SwiftUI

struct Toast: Equatable, CustomDebugStringConvertible {
    enum ToastType: Equatable {
        case success
        case error
    }
    let type: ToastType
    let message: String

    var icon: SFSymbol {
        switch type {
        case .success: .checkmarkSquareFill
        case .error: .xmarkSquareFill
        }
    }

    var backgroundColor: Color {
        switch type {
        case .success: Asset.Toast.Success.background.swiftUIColor
        case .error: Asset.Toast.Error.background.swiftUIColor
        }
    }

    var foregroundColor: Color {
        switch type {
        case .success: Asset.Toast.Success.foreground.swiftUIColor
        case .error: Asset.Toast.Error.foreground.swiftUIColor
        }
    }

    init(type: ToastType, message: String) {
        self.type = type
        self.message = message
    }

    var debugDescription: String {
        """
        Toast(
        type: \(type)
        message: \(message)
        )
        """
    }
}
