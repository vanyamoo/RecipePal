//
//  ExploreView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAssistants = RecipeAssistantModel.mocks
    
    var body: some View {
        NavigationStack {
            CarouselView(items: featuredAssistants) { assistant in
                HeroCellView(
                    title: assistant.name,
                    subtitle: assistant.description,
                    imageName: assistant.profileImageName
                )
            }
            .frame(height: 200)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
