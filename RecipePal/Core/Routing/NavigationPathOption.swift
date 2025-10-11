//
//  NavigationPathOption.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 11/10/2025.
//

import SwiftUI

enum NavigationPathOption: Hashable {
    case chat(assistantId: String)
    case category(category: Category, imageName: String)
}

extension View {
    func navigationDestinationForCoreModule(path: Binding<[NavigationPathOption]>) -> some View {
        self
            .navigationDestination(for: NavigationPathOption.self) { newValue in
                switch newValue {
                case .chat(assistantId: let assistantId):
                    ChatView(assistantId: assistantId)
                case .category(category: let category, imageName: let imageName):
                    CategoryListView(path: path, category: category, imageName: imageName)
                }
            }
    }
}
