//
//  User.swift
//  FoodRecipeApp
//

import FirebaseFirestore
import Foundation

struct BaseUser: Identifiable {
    let id: String
    let email: String
    let isEmailVerified: Bool
}

struct UserPublic: Codable, CustomDebugStringConvertible, Equatable, Identifiable {
    @DocumentID var id: String?
    var username: String
    var fullName: String
    var gender: Gender
    var profilePhotoURL: URL?

    init(
        id: String? = nil,
        username: String,
        fullName: String,
        gender: Gender,
        profilePhotoURL: URL? = nil
    ) {
        self.id = id
        self.username = username
        self.fullName = fullName
        self.gender = gender
        self.profilePhotoURL = profilePhotoURL
    }

    var debugDescription: String {
        """
        UserPublic(
            id: \(id ?? "nil"),
            username: \(username),
            fullName: \(fullName),
            gender: \(gender),
            profilePhotoURL: \(profilePhotoURL?.absoluteString ?? "nil")
        )
        """
    }
}

struct UserPrivate: Codable, CustomDebugStringConvertible, Identifiable {
    @DocumentID var id: String?
    var country: Country
    var birthDate: Date
    var phoneNumber: String
    var cookingLevel: CookingLevel
    var cuisinePreferences: [CuisinePreference]

    init(
        id: String? = nil,
        country: Country,
        birthDate: Date,
        phoneNumber: String,
        cookingLevel: CookingLevel,
        cuisinePreferences: [CuisinePreference]
    ) {
        self.id = id
        self.country = country
        self.birthDate = birthDate
        self.phoneNumber = phoneNumber
        self.cookingLevel = cookingLevel
        self.cuisinePreferences = cuisinePreferences
    }

    var debugDescription: String {
        """
        UserPublic(
            id: \(id ?? "nil"),
            country: \(country),
            birthDate: \(birthDate),
            phoneNumber: \(phoneNumber),
            cookingLevel: \(cookingLevel),
            cuisinePreferences: \(cuisinePreferences)
        )
        """
    }
}
