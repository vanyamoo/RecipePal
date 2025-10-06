//
//  ProfileView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView: Bool = false
    @State private var showCreateRecipeAssistantView: Bool = false
    @State private var currentUser: UserModel? = .mock
    @State private var myRecipeAssistants: [RecipeAssistantModel] = RecipeAssistantModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                
                myRecipeAssistantsSection
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showCreateRecipeAssistantView) {
            Text("Create Recipe Assistant")
        }
    }
    
    private var myInfoSection: some View {
        Section {
            Circle()
                .fill(currentUser?.profileColorCalculated ?? .accent)
                .frame(width: 100, height: 100)
                .frame(maxWidth: .infinity)
                .removeListRowFormatting()
        }
    }
    
    private var myRecipeAssistantsSection: some View {
        Section {
            ForEach(myRecipeAssistants, id: \.self) { assistant in
                CustomListCellView(
                    imageName: assistant.profileImageName,
                    title: assistant.name,
                    subtitle: nil
                )
                .anyButton(.highlight) {
                    
                }
                .removeListRowFormatting()
            }
            .onDelete { indexSet in
                onDeleteAssistant(indexSet: indexSet)
            }
            
        } header: {
            HStack(spacing: 0) {
                Text("My Recipe Assistants")
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .anyButton {
                        onNewAssistantButtonPressed()
                    }
            }
        }
    }
    
    private var settingsButton: some View {
        Button {
            onSettingsButtonTapped()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
                .foregroundStyle(.accent)
        }
    }
    
    private func onSettingsButtonTapped() {
        showSettingsView = true
    }
    
    private func onNewAssistantButtonPressed() {
        showCreateRecipeAssistantView = true
    }
    
    private func onDeleteAssistant(indexSet: IndexSet) {
        myRecipeAssistants.remove(atOffsets: indexSet)
    }
    
}

#Preview {
    ProfileView()
        .environment(AppState())
}
