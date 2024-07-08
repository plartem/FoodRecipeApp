//
//  EmailFieldValidator.swift
//  FoodRecipeApp
//
//  Created by Artem Hryn on 20.11.2023.
//

import Foundation
import UIKit

struct EmailFieldValidator: TextFieldFormatter {
    func format(_ string: String) -> String {
        return string
    }
}
