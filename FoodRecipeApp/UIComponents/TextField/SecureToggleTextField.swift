//
//  SecureToggleTextField.swift
//  FoodRecipeApp
//

import SFSafeSymbols
import SwiftUI

struct SecureToggleTextField: View {
    @State private var isSecure = true
    @Binding private var text: String
    private let placeholder: String
    private let prompt: Text?

    init(
        _ placeholder: String,
        text: Binding<String>,
        prompt: Text? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.prompt = prompt
    }

    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text, prompt: prompt)
                } else {
                    TextField(placeholder, text: $text, prompt: prompt)
                        .disableAutocorrection(true)
                }
            }
            .textFieldStyle(
                BottomBorderTextFieldStyle(
                    trailing: {
                        Button(
                            action: {
                                withAnimation {
                                    isSecure.toggle()
                                }
                            },
                            label: {
                                Image(systemSymbol: isSecure ? .eyeSlashFill : .eyeFill)
                            })
                    })
            )
        }
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            SecureToggleTextField("placeholder", text: bind(value: ""))
                .padding()
                .preferredColorScheme(scheme)
        }
    }
#endif
