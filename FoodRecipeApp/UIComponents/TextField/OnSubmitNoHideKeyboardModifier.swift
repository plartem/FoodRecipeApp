//
//  OnSubmitNoHideKeyboardModifier.swift
//  FoodRecipeApp
//
//  Created by Artem Hryn on 15.08.2023.
//

import SwiftUI

extension View {
    func custom(onSubmitNoHideKeyboard: @escaping () -> Void) -> some View {
        modifier(CustomTextFieldDelegateModifier(onSubmitNoHideKeyboard: onSubmitNoHideKeyboard))
    }

    func custom(validator: TextFieldValidator) -> some View {
        modifier(CustomTextFieldDelegateModifier(validator: validator))
    }

    func custom(
        onSubmitNoHideKeyboard: @escaping () -> Void,
        validator: TextFieldValidator
    ) -> some View {
        modifier(
            CustomTextFieldDelegateModifier(
                onSubmitNoHideKeyboard: onSubmitNoHideKeyboard, validator: validator))
    }
}

protocol TextFieldValidator {
    func validate(
        textField: UITextField, shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool
}

struct CustomTextFieldDelegateModifier: ViewModifier {
    private let delegate: CustomTextFieldDelegate

    init(
        onSubmitNoHideKeyboard: @escaping () -> Void,
        validator: TextFieldValidator? = nil
    ) {
        self.delegate = CustomTextFieldDelegate(
            returnAction: onSubmitNoHideKeyboard,
            validator: validator
        )
    }

    init(
        validator: TextFieldValidator? = nil
    ) {
        self.delegate = CustomTextFieldDelegate(
            validator: validator
        )
    }

    func body(content: Content) -> some View {
        content
            .introspect(.textField, on: .iOS(.v16, .v17)) { textField in
                textField.delegate = delegate
            }
    }

    private class CustomTextFieldDelegate: NSObject, UITextFieldDelegate {
        private var returnAction: (() -> Void)?
        private var validator: TextFieldValidator?

        init(returnAction: (() -> Void)? = nil, validator: TextFieldValidator? = nil) {
            super.init()
            self.returnAction = returnAction
            self.validator = validator
        }

        func textFieldShouldReturn(_: UITextField) -> Bool {
            guard let returnAction else { return true }
            returnAction()
            return false
        }

        func textField(
            _ textField: UITextField, shouldChangeCharactersIn range: NSRange,
            replacementString string: String
        ) -> Bool {
            return validator?.validate(
                textField: textField, shouldChangeCharactersIn: range, replacementString: string)
                ?? true
        }
    }
}
