//
//  CheckmarkToggleStyle.swift
//  FoodRecipeApp
//

import Foundation
import SwiftUI

extension ToggleStyle where Self == CheckmarkToggleStyle {
    static var checkmark: Self {
        return .init()
    }
}

struct CheckmarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8.0) {
            Image(
                systemSymbol: .checkmarkSquareFill
            )
            .font(
                .system(size: 20.0)
            )
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                configuration.isOn
                    ? Asset.Toggle.checkmarkColor.swiftUIColor
                    : Asset.Toggle.rectColor.swiftUIColor,
                Asset.Toggle.rectColor.swiftUIColor
            )

            configuration.label
                .normalStyleNoLineHeight()
                .bold()
                .primaryColor()
        }
        .contentShape(.rect)
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

#if DEBUG
    #Preview {
        VStack {
            Toggle(isOn: bind(value: false)) {
                Text("Label")
            }
            .toggleStyle(.checkmark)
        }
    }
#endif
