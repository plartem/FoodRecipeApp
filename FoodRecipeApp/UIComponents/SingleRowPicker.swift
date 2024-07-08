//
//  SingleRowPicker.swift
//  FoodRecipeApp
//

import SwiftUI

struct SingleRowPicker<Data, ID, Content>: View
where
    Data: RandomAccessCollection,
    Data: Equatable,
    Data.Element: Identifiable,
    Data.Element: Equatable,
    ID: Hashable,
    ID == Data.Element.ID,
    Content: View
{
    private var data: Data
    @Binding private var selection: Data.Element?
    private var row: (Data.Element) -> Content

    init(
        _ data: Data, selection: Binding<Data.Element?>,
        @ViewBuilder row: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self._selection = selection
        self.row = row
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(spacing: 18.0) {
                    ForEach(data) { element in
                        row(element)
                            .padding(20.0)
                            .background(Asset.Picker.background.swiftUIColor)
                            .clipShape(
                                .rect(cornerRadius: 16.0)
                            )
                            .contentShape(
                                .rect(cornerRadius: 16.0)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 16.0)
                                    .strokeBorder(
                                        selection == element
                                            ? Asset.Picker.selectedBorder.swiftUIColor
                                            : Asset.Picker.border.swiftUIColor,
                                        lineWidth: selection == element
                                            ? 2.0
                                            : 1.0
                                    )
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        withAnimation {
                                            if selection == element {
                                                selection = nil
                                            } else {
                                                selection = element
                                                proxy.scrollTo(element.id)
                                            }
                                        }
                                    }
                            )
                    }
                }
                .padding([.horizontal, .bottom], .Padding.content)
                .animation(.default, value: data)
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
    #Preview {
        struct TestData: Identifiable, Equatable {
            let id = UUID()
            let data: String

            init(_ data: String) {
                self.data = data
            }
        }
        return SingleRowPicker(
            (0..<20).map { TestData(String($0)) },
            selection: bind<TestData?>(value: nil)
        ) {
            Text($0.data)
        }

    }
#endif
