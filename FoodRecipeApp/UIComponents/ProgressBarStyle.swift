//
//  ProgressBarStyle.swift
//  FoodRecipeApp
//

import SwiftUI

struct ProgressBarStyle: ProgressViewStyle {
    var color: Color = Asset.accentColor.swiftUIColor
    var height: CGFloat = 10.0

    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0

        GeometryReader { geometry in
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color(uiColor: .systemGray5))
                    .frame(width: geometry.size.width, height: height)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(color)
                            .frame(width: geometry.size.width * progress)
                    }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ProgressView(
            value: 3,
            total: 10
        )
        .progressViewStyle(ProgressBarStyle())
        .padding()
    }
#endif
