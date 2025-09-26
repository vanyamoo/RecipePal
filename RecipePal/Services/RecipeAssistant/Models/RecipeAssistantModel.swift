//
//  RecipeAssistantModel.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 26/09/2025.
//

import Foundation

struct RecipeAssistantModel {
    let id: String
    let name: String?
    let cathegory: Cathegory?
    let cookingTime: CookingTime?
    let cuisine: Cuisine?
    let mainIngredient: MainIngredient?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        id: String,
        name: String? = nil,
        cathegory: Cathegory? = nil,
        cookingTime: CookingTime? = nil,
        cuisine: Cuisine? = nil,
        mainIngredient: MainIngredient? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.cathegory = cathegory
        self.cookingTime = cookingTime
        self.cuisine = cuisine
        self.mainIngredient = mainIngredient
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    static var mock: RecipeAssistantModel {
        mocks[0]
    }
    
    static var mocks: [RecipeAssistantModel] = [
        RecipeAssistantModel(id: UUID().uuidString, name: "Quick and Easy Lunch", cathegory: .healthyBowl, cookingTime: .tenMinutes, cuisine: nil, mainIngredient: .grainsAndLegumes, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "No effort dinner", cathegory: .traybakeDinner, cookingTime: .twentyMinutes, cuisine: nil, mainIngredient: .chicken, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Playdate Ideas", cathegory: .afternoonSnack, cookingTime: .fifteenMinutes, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Sunday Evening", cathegory: nil, cookingTime: .oneHour, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
    ]
}

enum Cathegory: String {
    case traybakeDinner = "Traybake Dinner"
    case healthyBowl = "Healthy Bowl"
    case quickAndEasy = "Quick and Easy"
    case soup = "Soup"
    case afternoonSnack = "Afternoon Snack"
    case cookingWithKids = "Cooking with Kids"
    case pasta = "Pasta"
    
    static var defaultValue: Self {
        .traybakeDinner
    }
}

enum CookingTime: Int {
    case fiveMinutes = 5
    case tenMinutes = 10
    case fifteenMinutes = 15
    case twentyMinutes = 20
    case thirtyMinutes = 30
    case fortyFiveMinutes = 45
    case oneHour = 60
    case twoHours = 120
    
    static var defaultValue: Self {
        .twentyMinutes
    }
}

enum Cuisine: String {
    case italian = "Italian"
    case indian = "Indian"
    case japanese = "Japanese"
    case asian = "Asian"
    
    static var defaultValue: Self {
        .italian
    }
    
}

enum MainIngredient: String {
    case chicken = "Chicken"
    case beef = "Beef"
    case pork = "Pork"
    case fishAndSeafood = "Fish and Seafood"
    case vegetables = "Vegetables"
    case grainsAndLegumes = "Grains and Legumes"
    case pasta = "Pasta"
    
    static var defaultValue: Self {
        .chicken
    }
}
