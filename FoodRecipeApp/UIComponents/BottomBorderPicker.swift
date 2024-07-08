//
//  BottomBorderPicker.swift
//  FoodRecipeApp
//

import Foundation
import SwiftUI

struct BottomBorderPicker<Data, Content>: View
where
    Data: RandomAccessCollection,
    Data: Equatable,
    Data.Element: Identifiable,
    Data.Element: Equatable,
    Data.Element: Hashable,
    Content: View
{
    private let data: Data
    @Binding private var selection: Data.Element?
    private let placeholder: String
    private let row: (Data.Element) -> Content

    init(
        _ data: Data,
        selection: Binding<Data.Element?>,
        placeholder: String,
        @ViewBuilder row: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self._selection = selection
        self.placeholder = placeholder
        self.row = row
    }

    var body: some View {
        Menu {
            Picker("", selection: $selection) {
                ForEach(data) { element in
                    row(element)
                        .tag(Optional(element))
                }
            }
        } label: {
            VStack {
                HStack {
                    Group {
                        if let element = selection {
                            row(element)
                                .foregroundColor(Asset.primaryColor.swiftUIColor)
                        } else {
                            Text(placeholder)
                                .secondaryColor()
                        }
                    }
                    .mediumStyle()
                    .fontWeight(.bold)

                    Spacer()
                }
                Divider()
                    .defaultStyle(color: Asset.accentColor.swiftUIColor)
            }
        }
    }
}
