//
//  BottomBorderTextFieldStyle.swift
//  FoodRecipeApp
//

import SwiftUI

struct BottomBorderTextFieldStyle<Content1: View, Content2: View>: TextFieldStyle {
    let leadingContent: Content1
    let trailingContent: Content2

    init(
        @ViewBuilder leading: () -> Content1 = { EmptyView() },
        @ViewBuilder trailing: () -> Content2 = { EmptyView() }
    ) {
        self.leadingContent = leading()
        self.trailingContent = trailing()
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 5.0) {
                leadingContent
                configuration
                    .mediumStyleNoLineHeight()
                    .fontWeight(.bold)
                    // SecureField has incorrect height
                    .frame(minHeight: .LineHeight.medium)
                trailingContent
            }
            Divider()
                .defaultStyle(color: Asset.accentColor.swiftUIColor)
                .padding(.top, 8.0)
        }
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            VStack {
                TextField(text: bind(value: ""), prompt: Text("P2")) {
                    Text("T2")
                }
                .textFieldStyle(BottomBorderTextFieldStyle())
            }
            .padding()
            .preferredColorScheme(scheme)
        }
    }
#endif
