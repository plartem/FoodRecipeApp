//
//  DatePicker+fix.swift
//  FoodRecipeApp
//

import Foundation
import SwiftUI

extension View {
    func fixDatePickerParentKeyboard() -> some View {
        modifier(DatePickerParentKeyboardFixModifier())
    }

    func fixDatePicker() -> some View {
        modifier(DatePickerFixModifier())
    }
}

struct DatePickerParentKeyboardFixModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                // fix keyboard appearing after closing DatePicker if TextField was in focus before opening DatePicker.
                UIApplication.shared.hideKeyboard()
            }
    }
}

struct DatePickerFixModifier: ViewModifier {
    private var shouldApply: Bool {
        guard #available(iOS 17.1, *) else {
            return true
        }
        return false
    }

    func body(content: Content) -> some View {
        content
            // overrides tap gesture to fix ios 17.1+ bug
            .onTapGesture(count: 99) {}
    }
}
