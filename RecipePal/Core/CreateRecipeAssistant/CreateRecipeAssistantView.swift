//
//  CreateRecipeAssistantView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 07/10/2025.
//

import SwiftUI

struct CreateRecipeAssistantView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var asistantName: String = ""
    
    @State private var selectedCategory: Category = .defaultValue
    @State private var selectedMainIngredient: MainIngredient = .defaultValue
    @State private var selectedCookingTime: CookingTime = .defaultValue
    @State private var selectedCuisine: Cuisine = .defaultValue
    
    @State private var isGenerating: Bool = false
    @State private var generatedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                attributesSection
                imageSection
            }
            .navigationTitle("Create Recipe Assistant")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .font(.title2)
            .fontWeight(.semibold)
            .anyButton {
                onBackButtonPressed()
            }
    }
    
    private var nameSection: some View {
        Section {
            TextField("Assistant 1", text: $asistantName)
        } header: {
            Text("Name Your Recipe Assistant *")
        }
    }

    private var attributesSection: some View {
        Section {
            Picker("Assist with recipes for...", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }
            
            Picker("with...", selection: $selectedMainIngredient) {
                ForEach(MainIngredient.allCases, id: \.self) { ingredient in
                    Text(ingredient.rawValue)
                        .tag(ingredient)
                }
            }

            Picker("that takes...", selection: $selectedCookingTime) {
                ForEach(CookingTime.allCases, id: \.self) { time in
                    Text(String(time.rawValue) + " min")
                        .tag(time.rawValue)
                }
            }

            Picker("Cuisine", selection: $selectedCuisine) {
                ForEach(Cuisine.allCases, id: \.self) { cuisine in
                    Text(cuisine.rawValue.capitalized)
                        .tag(cuisine)
                }
            }
        } header: {
            Text("Attributes")
        }
    }
    
    private var imageSection: some View {
        Section {
            HStack(alignment: .top) {
                ZStack {
                    Text("Generate image")
                        .underline()
                        .foregroundStyle(.accent)
                        .anyButton {
                            onGenerateImagePressed()
                        }
                        .opacity(isGenerating ? 0 : 1)
                    
                    ProgressView()
                        .tint(.accent)
                        .opacity(isGenerating ? 1 : 0)
                }
                .disabled(isGenerating || asistantName.isEmpty)
                
                Circle()
                    .fill(.secondary.opacity(0.3))
                    .overlay(
                        ZStack {
                            if let generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                    )
                    .clipShape(Circle())
            }
            .removeListRowFormatting()
            .padding(4)
        }

    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private func onGenerateImagePressed() {
        isGenerating = true
        
        Task {
            try? await Task.sleep(for: .seconds(3))
            generatedImage = UIImage(systemName: "star.fill")
            
            isGenerating = false
        }
    }
}

#Preview {
    CreateRecipeAssistantView()
}
