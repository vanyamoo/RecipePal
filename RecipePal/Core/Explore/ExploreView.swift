//
//  ExploreView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAssistants = RecipeAssistantModel.mocks
    @State private var categories: [Category] = Category.allCases
    
    var body: some View {
        NavigationStack {
            List {
                
                featuredSection
                
                categorySection

            }
            .navigationTitle("Explore")
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
                            CategoryCellView(title: category.rawValue.capitalized, imageName: Constants.randomImage)
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
}

#Preview {
    ExploreView()
}
