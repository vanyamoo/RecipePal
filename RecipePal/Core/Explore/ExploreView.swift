//
//  ExploreView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

enum NavigationPathOption: Hashable {
    case chat(assistantId: String)
    case category(category: Category, imageName: String)
}

struct ExploreView: View {
    
    @State private var featuredAssistants = RecipeAssistantModel.mocks
    @State private var categories: [Category] = Category.allCases
    @State private var popularAssistants = RecipeAssistantModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                
                featuredSection
                
                categorySection
                
                popularSection

            }
            .navigationTitle("Explore")
            .navigationDestination(for: NavigationPathOption.self) { newValue in
                switch newValue {
                case .chat(assistantId: let assistantId):
                    ChatView(assistantId: assistantId)
                case .category(category: let category, imageName: let imageName):
                    CategoryListView(category: category, imageName: imageName)
                }
            }
        }
    }
    
    private var featuredSection: some View {
        Section {
            CarouselView(items: featuredAssistants) { assistant in
                HeroCellView(
                    title: assistant.name,
                    subtitle: assistant.description,
                    imageName: assistant.profileImageName
                )
                .anyButton() {
                    onRecipeAssistantPressed(assistant: assistant)
                }
            }
            .removeListRowFormatting()
            
        } header: {
            Text("Featured")
        }
    }
    
    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            let imageName = popularAssistants.first(where: { $0.category == category })?.profileImageName
                            if let imageName {
                                CategoryCellView(title: category.plural, imageName: Constants.randomImage)
                                    .anyButton() {
                                        onCategoryPressed(category: category, imageName: imageName)
                                    }
                            }
                        }
                    }
                }
                .frame(height: 140)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
            
        } header: {
            Text("Categories")
        }
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAssistants, id: \.self) { assistant in
                CustomListCellView(
                    imageName: assistant.profileImageName,
                    title: assistant.name,
                    subtitle: assistant.description
                )
                .anyButton(.highlight) {
                    onRecipeAssistantPressed(assistant: assistant)
                }
            }
            .removeListRowFormatting()
            
        } header: {
            Text("Popular")
        }
    }
    
    private func onRecipeAssistantPressed(assistant: RecipeAssistantModel) {
        path.append(.chat(assistantId: assistant.id))
    }
    
    private func onCategoryPressed(category: Category, imageName: String) {
        path.append(.category(category: category, imageName: imageName))
    }
}

#Preview {
    ExploreView()
}
