//
//  ChatsView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var recentAssistants: [RecipeAssistantModel] = RecipeAssistantModel.mocks
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                if !recentAssistants.isEmpty {
                    recentsSection
                }
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
    
    private func onChatPressed(_ chat: ChatModel) {
        path.append(.chat(assistantId: chat.recipeAssistantId))
    }
    
    private var recentsSection: some View {
        Section(header: Text("Recents")) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(recentAssistants, id: \.self) { assistant in
                        VStack {
                            if let imageName = assistant.profileImageName {
                                ImageLoaderView(urlString: imageName)
                                    
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(height: 90)
                                
                                Text(assistant.name ?? "")
                                    .frame(width: 90)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .anyButton {
                            onAssistantPressed(assistant: assistant)
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
            }
            .frame(height: 120)
            .scrollIndicators(.hidden)
            .removeListRowFormatting()
        }
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
    
    private func onAssistantPressed(assistant: RecipeAssistantModel) {
        path.append(.chat(assistantId: assistant.id))
    }
}

#Preview {
    ChatsView()
}
