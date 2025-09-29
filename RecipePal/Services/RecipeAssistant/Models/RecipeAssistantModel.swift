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
    
    var description: String {
        RecipeAssistantDescriptionBuilder(assistant: self).assistantDescription
    }
    
    static var mock: RecipeAssistantModel {
        mocks[0]
    }
    
    static var mocks: [RecipeAssistantModel] = [
        RecipeAssistantModel(id: UUID().uuidString, name: "Quick and Easy Lunch", cathegory: .healthyBowl, cookingTime: .tenMinutes, cuisine: nil, mainIngredient: .grainsAndLegumes, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "No effort dinner", cathegory: .traybakeDinner, cookingTime: .twentyMinutes, cuisine: nil, mainIngredient: .chicken, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Playdate Ideas", cathegory: .afternoonSnack, cookingTime: .fifteenMinutes, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
        RecipeAssistantModel(id: UUID().uuidString, name: "Sunday Evening", cathegory: nil, cookingTime: .oneHour, cuisine: nil, mainIngredient: nil, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now)
    ]
}

struct RecipeAssistantDescriptionBuilder {
    var cathegory: Cathegory?
    var cookingTime: CookingTime?
    var cuisine: Cuisine?
    var mainIngredient: MainIngredient?
    
    init(cathegory: Cathegory? = nil, cookingTime: CookingTime? = nil, cuisine: Cuisine? = nil, mainIngredient: MainIngredient? = nil) {
        self.cathegory = cathegory
        self.cookingTime = cookingTime
        self.cuisine = cuisine
        self.mainIngredient = mainIngredient
    }
    
    init(assistant: RecipeAssistantModel) {
        self.cathegory = assistant.cathegory ?? .defaultValue
        self.cookingTime = assistant.cookingTime ?? .defaultValue
        self.cuisine = assistant.cuisine ?? .defaultValue
        self.mainIngredient = assistant.mainIngredient ?? .defaultValue
    }
    
    var assistantDescription: String {
        "Recipes for \(cathegory!.rawValue) \(mainIngredient!.rawValue) that takes \(cookingTime!.rawValue) min. \(cuisine!.rawValue)"
    }
}

enum Cathegory: String {
    case traybakeDinner = "a Traybake Dinner"
    case healthyBowl = "a Healthy Bowl"
    case quickAndEasy = "a Quick and Easy meal"
    case soup = "a Soup"
    case afternoonSnack = "a Snack"
    case cookingWithKids = "Cooking with Kids"
    case pasta = "a Pasta meal"
    case meal = "a meal"
    
    static var defaultValue: Self {
        meal
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
    case italian = "Italian."
    case indian = "Indian."
    case japanese = "Japanese."
    case asian = "Asian."
    case any = ""
    
    static var defaultValue: Self {
        .any
    }
    
}

enum MainIngredient: String {
    case chicken = "with Chicken"
    case beef = "with Beef"
    case pork = "with Pork"
    case fishAndSeafood = "with Fish/Seafood"
    case vegetables = "with Vegetables"
    case grainsAndLegumes = "with Grains/Legumes"
    case pasta = "with Pasta"
    case any = ""
    
    static var defaultValue: Self {
        .any
    }
}
