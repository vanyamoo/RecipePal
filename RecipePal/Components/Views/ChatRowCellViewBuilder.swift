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
    var chatMessage: ChatMessageModel = .mock
    var getRecipeAssistant: () async -> RecipeAssistantModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var recipeAssistant: RecipeAssistantModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenBy(currentUserId)
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: recipeAssistant?.profileImageName,
            title: recipeAssistant?.name,
            subtitle: lastChatMessage?.content,
            hasNewChat: hasNewChat
        )
        .task {
            // run a function to get the recipeAssistant from database
            recipeAssistant = await getRecipeAssistant()
            
            // run a function to get the last chat message from database
            lastChatMessage = await getLastChatMessage()
        }
    }
    
}

#Preview {
    ChatRowCellViewBuilder(
        getRecipeAssistant: { .mock },
        getLastChatMessage: { .mock }
    )
}
