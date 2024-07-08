//
//  AppDelegateFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation

@Reducer
public struct AppDelegateFeature {
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case didFinishLaunching
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .didFinishLaunching:
                return .none
            }
        }
    }
}
