//
//  Recipe.swift
//  FoodRecipeApp
//

import FirebaseFirestore
import Foundation

struct Recipe: Codable, CustomDebugStringConvertible, Equatable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var cookingTime: TimeInterval
    var servings: Int
    var ingredients: [String]
    var instructions: [Instruction]
    var origin: Country
    var previews: [Asset]
    var author: UserPublic
    let createdAt: Date
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case cookingTime
        case servings
        case ingredients
        case instructions
        case origin
        case previews
        case author
        case createdAt
        case updatedAt
    }

    var debugDescription: String {
        """
        UserPublic(
            id: \(id ?? "nil"),
            title: \(title),
            description: \(description),
            cookingTime: \(cookingTime),
            servings: \(servings),
            ingredients: \(ingredients),
            instructions: \(instructions),
            origin: \(origin),
            previews: \(previews),
            author: \(author),
            createdAt: \(createdAt),
            updatedAt: \(updatedAt)
        )
        """
    }
}

extension Recipe {
    struct Asset: Codable, Equatable {
        enum AssetType: String, Codable, Equatable {
            case image
            case video
        }
        let type: AssetType
        let url: String

        enum CodingKeys: String, CodingKey {
            case type
            case url
        }
    }

    struct Instruction: Codable, Equatable {
        var assets: [Asset]
        var text: String

        enum CodingKeys: String, CodingKey {
            case assets
            case text
        }
    }
}

extension Recipe {
    static let mock = Recipe(
        id: UUID().uuidString,
        title: "Original Italian Pizza Recipe for Test Purposes",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        cookingTime: 100.0, servings: 3,
        ingredients: [
            "1 ½ teaspoons active dry yeast",
            "½ teaspoon white sugar",
            "½ cup lukewarm water",
            "2 cups sifted all-purpose flour",
            "½ teaspoon salt",
            "2 tablespoons olive oil",
            "1 egg, beaten",
        ],
        instructions: [
            Recipe.Instruction(
                assets: [
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                ],
                text:
                    "Stir yeast and sugar into lukewarm water, using a fork. Let stand in a warm place until a creamy layer forms on top of the water, about 10 minutes."
            ),
            Recipe.Instruction(
                assets: [],
                text:
                    "Mix flour and salt in a large bowl. Mix olive oil into flour and stir for 2 minutes. Pour yeast mixture and beaten egg into flour mixture and stir to make a stiff dough. Turn dough out onto a floured work surface and knead until springy and smooth, about 8 minutes. Place dough into a floured bowl and cover with a piece of plastic wrap wiped with a thin film of olive oil."
            ),
            Recipe.Instruction(
                assets: [
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                    Recipe.Asset(
                        type: .image,
                        url:
                            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                ],
                text:
                    "Let dough rise until doubled, about 1 hour. Punch down and roll out to desired shape."
            ),
        ],
        origin: .us,
        previews: [
            Recipe.Asset(
                type: .image,
                url:
                    "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            )
        ],
        author: .init(username: "Test", fullName: "Full Name", gender: .male), createdAt: .now,
        updatedAt: .now)

}
