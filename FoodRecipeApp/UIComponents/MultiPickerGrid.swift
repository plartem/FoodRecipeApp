//
//  MultiPickerGrid.swift
//  FoodRecipeApp
//

import IdentifiedCollections
import SwiftUI

struct MultiPickerGrid<Data, ID, Content>: View
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
    @Binding private var selection: IdentifiedArrayOf<Data.Element>
    private var columnsCount: Int
    private var item: (Data.Element) -> Content

    init(
        _ data: Data, selection: Binding<IdentifiedArrayOf<Data.Element>>,
        columnsCount: Int = 1,
        @ViewBuilder item: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self._selection = selection
        self.columnsCount = max(columnsCount, 1)
        self.item = item
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(.flexible(), spacing: 16.0),
                        count: columnsCount
                    ),
                    spacing: 16.0
                ) {
                    ForEach(data) { element in
                        item(element)
                            .padding(20.0)
                            .frame(maxWidth: .infinity)
                            .background(Asset.Picker.background.swiftUIColor)
                            .clipShape(
                                .rect(cornerRadius: 16.0)
                            )
                            .contentShape(
                                .rect(cornerRadius: 16.0)
                            )
                            .overlay {
                                let selected = selection.contains(element)
                                RoundedRectangle(
                                    cornerRadius: 16.0
                                )
                                .strokeBorder(
                                    selected
                                        ? Asset.Picker.selectedBorder.swiftUIColor
                                        : Asset.Picker.border.swiftUIColor,
                                    lineWidth: selected
                                        ? 2.0
                                        : 1.0
                                )
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        withAnimation {
                                            if selection.contains(element) {
                                                selection.remove(element)
                                            } else {
                                                selection.append(element)
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
        return MultiPickerGrid(
            (0..<20).map { TestData(String($0)) },
            selection: bind<IdentifiedArrayOf<TestData>>(value: []),
            columnsCount: 3
        ) {
            Text("Test") + Text($0.data)
        }
    }
#endif
