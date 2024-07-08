//
//  PhoneFieldValidator.swift
//  FoodRecipeApp
//

import Foundation
import SwiftUI

struct PhoneFieldFormatter: TextFieldFormatter {
    private let formattingCharsDict: [Int: String] = [
        0: "(",
        3: ") ",
        6: "-",
    ]
    // (111) 111-1111
    func format(_ string: String) -> String {
        let numbers = string.filter { $0.isNumber }.prefix(10)
        var result = ""
        for (i, ch) in numbers.enumerated() {
            if let extra = formattingCharsDict[i] {
                result += extra
            }
            result += String(ch)
        }

        return result
    }
}
