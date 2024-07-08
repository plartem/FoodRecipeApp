//
//  DateFieldFormatter.swift
//  FoodRecipeApp
//

import Foundation
import UIKit

struct DateFieldFormatter: TextFieldFormatter {
    private var componentsLengths = [2, 2, 4]

    let dateFormatter: DateFormatter

    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }

    func format(_ string: String) -> String {
        let separator = String(dateFormatter.dateFormat.first(where: { !$0.isLetter }) ?? ".")
        var formattedString = ""
        var componentIndex = 0
        var currentLength = 0

        for (currentIndex, char) in zip(string.indices, string) {
            if char.isNumber {
                formattedString.append(char)
                currentLength += 1

                if currentLength == componentsLengths[componentIndex],
                    string.index(after: currentIndex) != string.endIndex
                {
                    if componentIndex == componentsLengths.count - 1 {
                        break
                    }
                    formattedString.append(separator)
                    currentLength = 0
                    componentIndex += 1
                }
            } else if currentLength != 0 {
                formattedString.append(separator)
                currentLength = 0
                componentIndex += 1
            }
        }

        return formattedString
    }
}
