//
//  SequentialEnum.swift
//  FoodRecipeApp
//

import Foundation

protocol SequentialEnum {
    func next() -> Self?
    func prev() -> Self?
}

extension SequentialEnum where Self: CaseIterable & Equatable {
    func next() -> Self? {
        let allCases = Array(Self.allCases)
        guard let currentIndex = allCases.firstIndex(of: self) else { return nil }
        return allCases[safe: currentIndex + 1]
    }

    func prev() -> Self? {
        let allCases = Array(Self.allCases)
        guard let currentIndex = allCases.firstIndex(of: self) else { return nil }
        return allCases[safe: currentIndex - 1]
    }
}
