//
//  CategoryListView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 11/10/2025.
//

import SwiftUI

struct CategoryListView: View {
    
    @Binding var path: [NavigationPathOption]
    var category: Category = .defaultValue
    var imageName: String = Constants.randomImage
    @State private var recipeAssistants: [RecipeAssistantModel] = RecipeAssistantModel.mocks
    
    var body: some View {
        List {
            CategoryCellView(
                title: category.plural,
                titleFont: .largeTitle,
                imageName: imageName,
                cornerRadius: 0
            )
            .removeListRowFormatting()
            
            ForEach(recipeAssistants, id: \.self) { assistant in
                CustomListCellView(
                    imageName: assistant.profileImageName,
                    title: assistant.name,
                    subtitle: assistant.description
                )
                .anyButton(.highlight, action: {
                    onAssistantPressed(assistant: assistant)
                })
                .removeListRowFormatting()
            }
        }
        .listStyle(.plain)
        .ignoresSafeArea()
    }
    
    private func onAssistantPressed(assistant: RecipeAssistantModel) {
        path.append(.chat(assistantId: assistant.id))
    }
}

#Preview {
    NavigationStack {
        CategoryListView(path: .constant([]))
    }
}
