//
//  LoadingPopup.swift
//  FoodRecipeApp
//

import PopupView
import SwiftUI

extension View {
    func loadingPopup(
        isPresented: Binding<Bool>,
        message: String
    ) -> some View {
        modifier(
            LoadingPopupModifier(
                isPresented: isPresented,
                message: message
            ))
    }
}

struct LoadingPopupModifier: ViewModifier {
    @Binding var isPresented: Bool
    var message: String

    func body(content: Content) -> some View {
        content
            .blur(radius: isPresented ? 5.0 : 0.0)
            .popup(
                isPresented: $isPresented,
                view: {
                    VStack(spacing: 16.0) {
                        Text(message)
                            .largeStyle()
                            .bold()
                            .foregroundColor(Asset.accentColor.swiftUIColor)
                            .multilineTextAlignment(.center)
                        ActivityIndicator()
                            .frame(
                                width: 50.0,
                                height: 50.0
                            )
                    }
                    .padding(.Padding.content)
                    .frame(maxWidth: 300.0)
                    .background(Asset.secondaryBackground.swiftUIColor)
                    .clipShape(.rect(cornerRadius: 16.0))
                    .contentShape(.rect(cornerRadius: 16.0))
                },
                customize: {
                    $0
                        .backgroundColor(.black.opacity(0.3))
                        .position(.center)
                        .closeOnTap(false)
                        .dragToDismiss(false)
                        .isOpaque(false)
                        .animation(.spring())
                }
            )
    }
}

#Preview {
    Color.gray
        .loadingPopup(isPresented: bind(value: true), message: "Test")
}
