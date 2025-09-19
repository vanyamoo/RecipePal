//
//  TabBarView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "eyes") {
                ExploreView()
            }
            
            Tab("Chats", systemImage: "bubble.left.and.bubble.right.fill") {
                ChatsView()
            }
            
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    TabBarView()
}
