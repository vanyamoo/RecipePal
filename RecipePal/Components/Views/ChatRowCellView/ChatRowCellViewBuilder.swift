//
//  ChatRowCellViewBuilder.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 03/10/2025.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getRecipeAssistant: () async -> RecipeAssistantModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var recipeAssistant: RecipeAssistantModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State private var didloadRecipeAssistant: Bool = false
    @State private var didLoadChatMessage: Bool = false
    
    private var isLoading: Bool {
        didloadRecipeAssistant == false || didLoadChatMessage == false
    }
    
    private var subtitle: String? {
        if isLoading {
            return "xxxx xxxx xxxx xx xxxxxxx"
        }
        
        if recipeAssistant == nil && lastChatMessage == nil {
            return "Error"
        }
        
        return lastChatMessage?.content
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenBy(currentUserId)
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: recipeAssistant?.profileImageName,
            title: isLoading ? "xxxxx xxxxx" : recipeAssistant?.name,
            subtitle: subtitle,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            // run a function to get the recipeAssistant from database
            recipeAssistant = await getRecipeAssistant()
            didloadRecipeAssistant = true
            
            // run a function to get the last chat message from database
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
    
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(
            getRecipeAssistant: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            },
            getLastChatMessage: {
                try? await Task.sleep(for: .seconds(5))
                return .mock
            })
        
        ChatRowCellViewBuilder(
            getRecipeAssistant: { .mock },
            getLastChatMessage: { .mock }
        )
    }
}
