//
//  RecipeAssistantModel.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 26/09/2025.
//

import Foundation

struct RecipeAssistantModel: Hashable {
    let id: String
    let name: String?
    let category: Category?
    let cookingTime: CookingTime?
    let cuisine: Cuisine?
    let mainIngredient: MainIngredient?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        id: String,
        name: String? = nil,
        category: Category? = nil,
        cookingTime: CookingTime? = nil,
        cuisine: Cuisine? = nil,
        mainIngredient: MainIngredient? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.cookingTime = cookingTime
        self.cuisine = cuisine
        self.mainIngredient = mainIngredient
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var description: String {
        RecipeAssistantDescriptionBuilder(assistant: self).assistantDescription
    }
    
    static var mock: RecipeAssistantModel {
        mocks[0]
    }
    
    static var mocks: [RecipeAssistantModel] = [
        RecipeAssistantModel(id: UUID().uuidString, name: "Quick and Easy Lunch", category: .healthyBowl, cookingTime: .tenMinutes, cuisine: nil, mainIngredient: .grainsAndLegumes, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "No effort dinner", category: .traybakeDinner, cookingTime: .twentyMinutes, cuisine: nil, mainIngredient: .chicken, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Playdate Ideas", category: .afternoonSnack, cookingTime: .fifteenMinutes, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Sunday Evening", category: nil, cookingTime: .oneHour, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
    ]
}
