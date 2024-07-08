//
//  Divider.swift
//  FoodRecipeApp
//

import SwiftUI

extension Divider {
    func defaultStyle(
        _ axis: Axis = .horizontal,
        color: Color = Asset.dividerColor.swiftUIColor
    ) -> some View {
        modifier(DefaultDividerModifier(axis, color: color))
    }
}

struct DefaultDividerModifier: ViewModifier {
    let axis: Axis
    let color: Color

    init(_ axis: Axis, color: Color) {
        self.axis = axis
        self.color = color
    }

    func body(content: Content) -> some View {
        Group {
            switch axis {
            case .horizontal:
                content
                    .frame(height: 1.0)
            case .vertical:
                content
                    .frame(width: 1.0)
            }
        }
        .background(color)
    }
}

// MARK: - Preview

#if DEBUG
    #Preview {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            Divider()
                .defaultStyle()
                .preferredColorScheme(scheme)
                .padding(16.0)
        }
    }
#endif
