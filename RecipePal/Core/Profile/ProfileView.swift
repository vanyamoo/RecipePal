//
//  ProfileView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSettingsView: Bool = false
    @State private var currentUser: UserModel? = .mock
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                
                Section {
                    
                } header: {
                    Text("My Avatars")
                }

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
    
}

#Preview {
    ProfileView()
}
