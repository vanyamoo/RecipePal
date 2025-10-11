//
//  ChatView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 08/10/2025.
//

import SwiftUI

struct ChatView: View {
    
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var recipeAssistant: RecipeAssistantModel? = .mock
    @State private var currentUser: UserModel? = .mock
    
    @State private var textFieldText: String = ""
    @State private var scrollPosition: String?
    
    @State private var showChatSettings: AnyAppAlert?
    @State private var alert: AnyAppAlert?
    
    @State private var showProfileModal: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            textFieldSection
        }
        .navigationTitle(recipeAssistant?.name ?? "Chat")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .anyButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .showCustomAlert(type: .confirmationDialog, alert: $showChatSettings)
        .showCustomAlert(alert: $alert)
        .showModal($showProfileModal) {
            if let recipeAssistant {
                ProfileModalView(
                    imageName: recipeAssistant.profileImageName,
                    title: recipeAssistant.name ?? "",
                    subtitle: recipeAssistant.category?.rawValue.capitalized,
                    headline: recipeAssistant.description,
                    onXMarkPressed: {
                        showProfileModal = false
                    }
                )
                .padding(40)
                .transition(.slide)
            }
        }
    }
    
    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId
                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : recipeAssistant?.profileImageName,
                        onImagePressed: onRecipeAssistantImagePressed
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .defaultScrollAnchor(.bottom)
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }
    
    private var textFieldSection: some View {
        TextField("Say something...", text: $textFieldText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 60)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.accent)
                    .padding(.trailing, 4)
                    .anyButton {
                        onSendMessagePressed()
                    }
                , alignment: .trailing)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(.systemBackground))
                    
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            )
            .padding(.vertical, 6)
            .padding(.horizontal, 20)
            .background(Color(.secondarySystemBackground))
    }
    
    private func onSendMessagePressed() {
        guard let currentUser else { return }
        
        let content = textFieldText
        
        do {
            try TextValidationHelper.checkIfTextIsValid(content)
            
            let message = ChatMessageModel(
                id: UUID().uuidString,
                chatId: UUID().uuidString,
                authorId: currentUser.userId,
                content: content,
                seenByIds: nil,
                dateCreated: .now
            )
            
            chatMessages.append(message)
            
            scrollPosition = message.id
            
            textFieldText = ""
        } catch {
            alert = AnyAppAlert(error: error)
        }
    }
    
    private func onChatSettingsPressed() {
        showChatSettings = AnyAppAlert(
            title: "",
            subtitle: "What would you like to do?",
            buttons: {
                AnyView(
                    Group {
                        Button("Report User / Chat", role: .destructive) {
                            
                        }
                        Button("Delete Chat", role: .destructive) {
                            
                        }
                    }
                )
            }
        )
    }
    
    private func onRecipeAssistantImagePressed() {
        showProfileModal = true
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
