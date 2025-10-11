//
//  ChatsView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                        getRecipeAssistant: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                    )
                    .anyButton(.highlight, action: {
                        onChatPressed(chat)
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("Chats")
        }
    }
    
    private func onChatPressed(_ chat: ChatModel) {
        path.append(.chat(assistantId: chat.recipeAssistantId))
    }
}

#Preview {
    ChatsView()
}
