//
//  OnboardingCuisinePreferenceView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SwiftUI

@ViewAction(for: OnboardingCuisinePreferenceFeature.self)
struct OnboardingCuisinePreferenceView: View {
    typealias Feature = OnboardingCuisinePreferenceFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(L10n.Onboarding.CuisinePreference.title)
                    .headerStyle()
                    .fontWeight(.bold)
                    .primaryColor()
                    .padding(.bottom, .Padding.headerBottom)
                Text(L10n.Onboarding.CuisinePreference.caption)
                    .normalStyle()
                    .primaryColor()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.Padding.content)

            MultiPickerGrid(
                store.cuisinePreferences,
                selection: $store.selectedCuisinePreferences,
                columnsCount: 3
            ) { preference in
                CuisineItemView(cuisinePreference: preference)
            }

            Divider()
                .defaultStyle()
            HStack(spacing: 16.0) {
                Button(L10n.Onboarding.BottomBar.skip) {
                    send(
                        .skipButtonTapped,
                        animation: .default
                    )
                }
                .buttonStyle(.secondary)

                Button(L10n.Onboarding.BottomBar.proceed) {
                    send(
                        .proceedButtonTapped,
                        animation: .default
                    )
                }
                .buttonStyle(.primary)
                .disabled(store.disableProceedButton)
            }
            .padding([.horizontal, .top], .Padding.content)
            .padding(.bottom, 8.0)
        }
        .background(Asset.primaryBackground.swiftUIColor)
    }
}

#if DEBUG
    #Preview {
        OnboardingCuisinePreferenceView(
            store: Store(initialState: OnboardingCuisinePreferenceFeature.State()) {
                OnboardingCuisinePreferenceFeature()
            })
    }
#endif
