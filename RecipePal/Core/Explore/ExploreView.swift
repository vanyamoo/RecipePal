//
//  ExploreView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ExploreView: View {
    
    let assistants = RecipeAssistantModel.mocks
    
    var body: some View {
        NavigationStack {
            CarouselView(items: assistants) { item in
                HeroCellView(
                    title: item.name,
                    subtitle: item.description,
                    imageName: item.profileImageName
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
