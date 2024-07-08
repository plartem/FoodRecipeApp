//
//  TextFieldReducer.swift
//  FoodRecipeApp
//
//  Created by Artem Hryn on 21.10.2023.
//

import ComposableArchitecture

//struct TextFieldReducer: Reducer {
//    struct State: Equatable {
//        @BindingState var text: String = ""
//    }
//
//    enum Action: BindableAction, Equatable {
//        case textFieldSubmitted
//
//        case binding(BindingAction<State>)
//    }
//
//    var body: some ReducerOf<Self> {
//        BindingReducer()
//            .onChange(of: <#T##(_) -> Equatable#>, <#T##reducer: (Equatable, Equatable) -> Reducer##(Equatable, Equatable) -> Reducer##(_ oldValue: Equatable, _ newValue: Equatable) -> Reducer#>)
//        Reduce { state, action in
//            switch action {
//            case .binding(\.$text):
//                let filtered = state.phoneNumber.filter { $0.isNumber }
//                return filtered != state.phoneNumber
//                ? .run { send in
//                    await send(.binding(.set(\.$phoneNumber, filtered)))
//                }
//                : .none
//            case .binding:
//                return .none
//            case .textFieldSubmitted:
//                switch state.focusedField {
//                case .some(let field):
//                    state.focusedField = field.next()
//                case .none:
//                    break
//                }
//                return .none
//        }
//    }
//}
