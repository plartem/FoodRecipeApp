//
//  OnboardingCountrySelectionView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SFSafeSymbols
import SwiftUI

@ViewAction(for: OnboardingCountrySelectionFeature.self)
struct OnboardingCountrySelectionView: View {
    typealias Feature = OnboardingCountrySelectionFeature
    @Bindable var store: StoreOf<Feature>

    @FocusState private var focusedField: Feature.State.Field?

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                if store.showHeader {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(L10n.Onboarding.Country.title)
                            .headerStyle()
                            .fontWeight(.bold)
                            .primaryColor()
                            .padding(.bottom, .Padding.headerBottom)
                        Text(L10n.Onboarding.Country.caption)
                            .normalStyle()
                            .primaryColor()
                            .padding(.bottom, .Padding.formElementBottom)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(
                        .move(edge: .top)
                            .combined(with: .opacity)
                    )
                }

                TextField(
                    "",
                    text: $store.countryFilter.removeDuplicates(),
                    prompt: Text(L10n.Onboarding.Country.SearchField.placeholder)
                        .placeholderStyle()
                )
                .textFieldStyle(
                    BackgroundedTextFieldStyle(leading: {
                        Image(systemSymbol: .magnifyingglass)
                            .normalStyle()
                            .tertiaryColor()
                    })
                )
                .textContentType(.countryName)
                .submitLabel(.search)
                .focused($focusedField, equals: .countryFilter)
                .id(Feature.State.Field.countryFilter)
                .onSubmit {}
            }
            .padding(.Padding.content)
            .frame(maxWidth: .infinity, alignment: .leading)

            SingleRowPicker(
                store.displayedCountries,
                selection: $store.selectedCountry
            ) { country in
                CountryRowView(country: country)
            }

            Divider()
                .defaultStyle()
            Button(L10n.Onboarding.BottomBar.proceed) {
                send(
                    .proceedButtonTapped,
                    animation: .default
                )
            }
            .buttonStyle(.primary)
            .disabled(store.disableProceedButton)
            .padding([.horizontal, .top], .Padding.content)
            .padding(.bottom, 8.0)
        }
        .frame(maxWidth: .infinity)
        .background(Asset.primaryBackground.swiftUIColor)
        .task {
            send(.task)
        }
        .bind($store.focusedField.animation(), to: $focusedField)
    }
}

#if DEBUG
    #Preview {
        OnboardingCountrySelectionView(
            store: Store(initialState: OnboardingCountrySelectionFeature.State()) {
                OnboardingCountrySelectionFeature()
            })
    }
#endif
