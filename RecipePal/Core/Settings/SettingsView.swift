//
//  SettingsView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 24/09/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutButtonTapped()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func onSignOutButtonTapped() {
        // do some logic to sign user out of app!
        
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
    }
    
}

fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(.systemBackground))
    }
    
}

#Preview {
    SettingsView()
        .environment(AppState())
}
