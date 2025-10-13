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
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
    
    private func onChatPressed(_ chat: ChatModel) {
        path.append(.chat(assistantId: chat.recipeAssistantId))
    }
    
    @ViewBuilder
    private var chatsSection: some View {
        if chats.isEmpty {
            Text("Your chats will appear here!")
                .foregroundStyle(.secondary)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(40)
                .removeListRowFormatting()
        } else {
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
    }
}

#Preview {
    ChatsView()
}
