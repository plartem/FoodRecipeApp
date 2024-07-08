//
//  ActivityIndicator.swift
//  FoodRecipeApp
//

import SwiftUI

struct ActivityIndicator: View {
    @State private var isAnimating: Bool = false
    let dotsAmount = 5.0

    var body: some View {
        GeometryReader { geometry in
            let dotDiameter = geometry.size.width / dotsAmount
            ForEach(0..<Int(dotsAmount), id: \.self) { index in
                Group {
                    Circle()
                        .foregroundColor(Asset.accentColor.swiftUIColor)
                        .frame(
                            width: dotDiameter,
                            height: dotDiameter
                        )
                        .scaleEffect(
                            isAnimating
                                ? CGFloat(index + 1) / dotsAmount
                                : 1 - CGFloat(index) / dotsAmount
                        )
                        .offset(
                            y: dotDiameter / 2 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
                .animation(
                    .timingCurve(
                        0.5, 0.15 + Double(index) / dotsAmount,
                        0.25, 1,
                        duration: 1.5
                    )
                    .repeatForever(autoreverses: false),
                    value: isAnimating
                )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .task {
            isAnimating = true
        }
    }
}
