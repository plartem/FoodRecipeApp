//
//  UIApplication+extension.swift
//  FoodRecipeApp
//

import UIKit

// MARK: - Hide keyboard when tapped outside TextField

extension UIApplication {
    var keyWindows: [UIWindow] {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .filter { $0.isKeyWindow }
    }

    func hideKeyboardOnTappedAround() {
        guard let window = self.keyWindows.first else { return }
        let tapGesture = UITapGestureRecognizer(
            target: window,
            action: #selector(UIView.endEditing)
        )
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch
    ) -> Bool {
        if touch.view is UITextField {
            return false
        }
        return true
    }
    public func gestureRecognizer(
        _ sender: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer
    ) -> Bool {
        return true
    }
}
