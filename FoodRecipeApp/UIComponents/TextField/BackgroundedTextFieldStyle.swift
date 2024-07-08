//
//  BackgroundedTextFieldStyle.swift
//  FoodRecipeApp
//

import SwiftUI

struct BackgroundedTextFieldStyle<Content1: View, Content2: View>: TextFieldStyle {
    private let leadingContent: Content1?
    private let trailingContent: Content2?

    init(
        @ViewBuilder leading: () -> Content1 = { EmptyView() },
        @ViewBuilder trailing: () -> Content2 = { EmptyView() }
    ) {
        self.leadingContent = leading()
        self.trailingContent = trailing()
    }

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack(spacing: 12.0) {
            leadingContent
            configuration
                .smallStyleNoLineHeight()
                .primaryColor()
                .fontWeight(.semibold)
            trailingContent
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 18.0)
        .background(Asset.secondaryBackground.swiftUIColor)
        .cornerRadius(16.0)
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
                .textFieldStyle(BackgroundedTextFieldStyle())

            }
            .padding()
            .preferredColorScheme(scheme)
        }
    }
#endif
