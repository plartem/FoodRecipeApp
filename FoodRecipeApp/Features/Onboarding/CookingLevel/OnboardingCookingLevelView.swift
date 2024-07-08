//
//  OnboardingCountrySelectionView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SFSafeSymbols
import SwiftUI

@ViewAction(for: OnboardingCookingLevelFeature.self)
struct OnboardingCookingLevelView: View {
    typealias Feature = OnboardingCookingLevelFeature
    @Bindable var store: StoreOf<Feature>

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(L10n.Onboarding.CookingLevel.title)
                    .headerStyle()
                    .fontWeight(.bold)
                    .primaryColor()
                    .padding(.bottom, .Padding.headerBottom)
                Text(L10n.Onboarding.CookingLevel.caption)
                    .normalStyle()
                    .primaryColor()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.Padding.content)

            SingleRowPicker(
                store.cookingLevels,
                selection: $store.selectedCookingLevel
            ) { cookingLevel in
                VStack(alignment: .leading, spacing: 0) {
                    Text(cookingLevel.name)
                        .mediumStyle()
                        .fontWeight(.semibold)
                        .padding(.bottom, 14.0)
                    Text(cookingLevel.description)
                        .smallStyle()
                        .tertiaryColor()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
        .background(Asset.primaryBackground.swiftUIColor)
    }
}

#if DEBUG
    #Preview {
        OnboardingCookingLevelView(
            store: Store(initialState: OnboardingCookingLevelFeature.State()) {
                OnboardingCookingLevelFeature()
            })
    }
#endif
