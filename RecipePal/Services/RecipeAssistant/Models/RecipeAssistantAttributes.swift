//
//  RecipeAssistantAttributes.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 07/10/2025.
//

import Foundation

enum Category: String, CaseIterable, Hashable {
    case traybakeDinner = "a Traybake Dinner"
    case healthyBowl = "a Healthy Bowl"
    case quickAndEasy = "a Quick and Easy meal"
    case soup = "a Soup"
    case afternoonSnack = "a Snack"
    case cookingWithKids = "Cooking with Kids"
    case pasta = "a Pasta meal"
    case meal = "a meal"
    
    static var defaultValue: Self {
        .meal
    }
    
    var plural: String {
        switch self {
        case .traybakeDinner:
            return "Traybake Dinners"
        case .healthyBowl:
            return "Healthy Bowls"
        case .quickAndEasy:
            return "Quick and Easy meals"
        case .soup:
            return "Soups"
        case .afternoonSnack:
            return "Snacks"
        case .cookingWithKids:
            return "Cooking with Kids"
        case .pasta:
            return "Pasta meals"
        case .meal:
            return "Meals"
        }
    }
}

enum CookingTime: Int, CaseIterable, Hashable {
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

enum Cuisine: String, CaseIterable, Hashable {
    case italian = "Italian."
    case indian = "Indian."
    case japanese = "Japanese."
    case asian = "Asian."
    case any = "Any cuisine"
    
    static var defaultValue: Self {
        .any
    }
}

enum MainIngredient: String, CaseIterable, Hashable {
    case chicken = "with Chicken"
    case beef = "with Beef"
    case pork = "with Pork"
    case fishAndSeafood = "with Fish/Seafood"
    case vegetables = "with Vegetables"
    case grainsAndLegumes = "with Grains/Legumes"
    case pasta = "with Pasta"
    case any = "with any ingredient"
    
    static var defaultValue: Self {
        .chicken
    }
}

struct RecipeAssistantDescriptionBuilder {
    var category: Category?
    var cookingTime: CookingTime?
    var cuisine: Cuisine?
    var mainIngredient: MainIngredient?
    
    init(category: Category? = nil, cookingTime: CookingTime? = nil, cuisine: Cuisine? = nil, mainIngredient: MainIngredient? = nil) {
        self.category = category
        self.cookingTime = cookingTime
        self.cuisine = cuisine
        self.mainIngredient = mainIngredient
    }
    
    init(assistant: RecipeAssistantModel) {
        self.category = assistant.category ?? .defaultValue
        self.cookingTime = assistant.cookingTime ?? .defaultValue
        self.cuisine = assistant.cuisine ?? .defaultValue
        self.mainIngredient = assistant.mainIngredient ?? .defaultValue
    }
    
    var assistantDescription: String {
        "Recipes for \(category!.rawValue) \(mainIngredient!.rawValue) that takes \(cookingTime!.rawValue) min. \(cuisine!.rawValue)"
    }
}
