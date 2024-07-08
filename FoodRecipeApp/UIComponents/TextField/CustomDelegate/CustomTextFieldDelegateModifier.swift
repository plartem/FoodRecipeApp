//
//  CustomTextFieldDelegateModifier.swift
//  FoodRecipeApp
//

import SwiftUI

extension View {
    func customizeTextField(
        onSubmitNoHideKeyboard: (() -> Void)? = nil,
        formatterContext: CustomTextFieldDelegateModifier.FormatterContext? = nil
    ) -> some View {
        modifier(
            CustomTextFieldDelegateModifier(
                onSubmitNoHideKeyboard: onSubmitNoHideKeyboard,
                formatterContext: formatterContext))
    }
}

protocol TextFieldFormatter {
    func format(_ string: String) -> String
}

struct CustomTextFieldDelegateModifier: ViewModifier {
    struct FormatterContext {
        let formatter: TextFieldFormatter
        @Binding var valueBinding: String

        init(formatter: TextFieldFormatter, valueBinding: Binding<String>) {
            self.formatter = formatter
            self._valueBinding = valueBinding
        }
    }

    private let delegate: UITextFieldDelegate

    init(
        onSubmitNoHideKeyboard: (() -> Void)? = nil,
        formatterContext: FormatterContext? = nil
    ) {
        self.delegate = CustomTextFieldDelegate(
            returnAction: onSubmitNoHideKeyboard,
            formatterContext: formatterContext
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
        private var formatterContext: FormatterContext?

        init(
            returnAction: (() -> Void)? = nil, formatterContext: FormatterContext? = nil
        ) {
            self.returnAction = returnAction
            self.formatterContext = formatterContext
            super.init()
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
            guard let formatterContext, let text = textField.text else { return true }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            let formatResult = formatterContext.formatter.format(newString)
            formatterContext.valueBinding = formatResult
            textField.text = formatResult
            var currentPosition = range.location + 1
            if newString.count < formatResult.count {
                currentPosition += formatResult.count - newString.count
            }
            if let newPosition = textField.position(
                from: textField.beginningOfDocument,
                offset: currentPosition
            ) {
                textField.selectedTextRange = textField.textRange(
                    from: newPosition, to: newPosition)
            }
            return false
        }
    }
}
