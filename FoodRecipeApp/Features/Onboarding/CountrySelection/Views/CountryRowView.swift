//
//  CountryRowView.swift
//  FoodRecipeApp
//

import SwiftUI

struct CountryRowView: View {
    let country: Country

    var body: some View {
        HStack(spacing: 18.0) {
            Image(asset: country.flagAsset)
                .resizable()
                .scaledToFit()
                .frame(width: 40.0)
                .clipShape(.rect(cornerRadius: 8.0))
            Text(country.rawValue)
                .normalStyle()
                .fontWeight(.medium)
                .tertiaryColor()
                .frame(width: 32.0)
            Text(country.fullName)
                .normalStyle()
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

#if DEBUG
    #Preview {
        VStack {
            CountryRowView(country: .ad)
        }
        .padding(.Padding.content)
    }
#endif
