//
//  BackSymbolButton.swift
//  FoodRecipeApp
//

import SFSafeSymbols
import SwiftUI

struct BackSymbolButton: View {
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemSymbol: .arrowLeft)
                .largeStyle()
        }
        .buttonStyle(.normalIcon)
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            BackSymbolButton {}
                .preferredColorScheme(scheme)
        }
    }
#endif
