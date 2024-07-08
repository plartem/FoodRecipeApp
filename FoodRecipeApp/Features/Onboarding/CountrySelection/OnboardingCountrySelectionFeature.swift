//
//  OnboardingCountrySelectionFeature.swift
//  FoodRecipeApp
//

import ComposableArchitecture

@Reducer
struct OnboardingCountrySelectionFeature {
    @ObservableState
    struct State: Equatable {
        var focusedField: Field?
        var showHeader: Bool { focusedField != .countryFilter }

        var allCountries = IdentifiedArray(uniqueElements: Country.allCases)

        var countryFilter: String = ""
        var selectedCountry: Country?
        var displayedCountries: IdentifiedArrayOf<Country> {
            let lowercasedFilter = countryFilter.lowercased()
            return countryFilter.isEmpty
                ? allCountries
                : allCountries.filter { $0.fullName.lowercased().contains(lowercasedFilter) }
        }
        var disableProceedButton: Bool {
            selectedCountry == nil
        }

        enum Field: CaseIterable, Equatable, SequentialEnum {
            case countryFilter
        }
    }

    enum Action: ViewAction, Equatable {
        case view(View)
        enum View: BindableAction, Equatable {
            case task
            case binding(BindingAction<State>)
            case proceedButtonTapped
        }

        case delegate(Delegate)
        enum Delegate {
            case switchToNextStep
        }
    }

    var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)
        Reduce<State, Action> { state, action in
            switch action {
            case .view(let viewAction):
                switch viewAction {
                case .task:
                    state.focusedField = nil
                    return .none

                case .proceedButtonTapped:
                    return .send(.delegate(.switchToNextStep))

                case .binding:
                    return .none
                }
            case .delegate:
                return .none
            }
        }
    }
}
