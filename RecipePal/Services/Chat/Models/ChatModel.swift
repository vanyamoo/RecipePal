//
//  ChatModel.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 02/10/2025.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String // the user that created the chat
    let recipeAssistantId: String // the recipeAssistant that the user is chatting with
    let dateCreated: Date
    let dateModified: Date
    
    static var mock: ChatModel {
        mocks[0]
    }
    
    static var mocks: [ChatModel] {
        let now = Date()
        return [
            ChatModel(id: "mock_chat_1", userId: "user1", recipeAssistantId: "recipeAssistant1", dateCreated: now.addingTimeInterval(hours: -1), dateModified: now.addingTimeInterval(minutes: -30)),
            ChatModel(id: "mock_chat_2", userId: "user2", recipeAssistantId: "recipeAssistant2", dateCreated: now.addingTimeInterval(hours: -2), dateModified: now.addingTimeInterval(hours: -1)),
            ChatModel(id: "mock_chat_3", userId: "user3", recipeAssistantId: "recipeAssistant3", dateCreated: now, dateModified: now),
            ChatModel(id: "mock_chat_4", userId: "user4", recipeAssistantId: "recipeAssistant4", dateCreated: now.addingTimeInterval(days: -1), dateModified: now.addingTimeInterval(hours: -10)),
        ]
    }
}

extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let dayInterval = TimeInterval(days * 24 * 60 * 60)
        let hourInterval = TimeInterval(hours * 60 * 60)
        let minuteInterval = TimeInterval(minutes * 60)
        return self.addingTimeInterval(dayInterval + hourInterval + minuteInterval)
    }
}
