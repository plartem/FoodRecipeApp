//
//  PreviewBindingHelper.swift
//  FoodRecipeApp
//

import SwiftUI

#if DEBUG
    public func bind<V>(value: V) -> Binding<V> {
        var value = value
        return .init(get: { value }, set: { value = $0 })
    }
#endif
