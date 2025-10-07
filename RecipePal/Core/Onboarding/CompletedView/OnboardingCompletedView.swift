//
//  OnboardingCompletedView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 22/09/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    @State private var isCompletingProfileSetup = false
    var selectedTheme: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
                    Text("Setup complete!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(selectedTheme)
                    
                    Text("We've set up your profile and you're ready to start chatting")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
                .frame(maxHeight: .infinity)
                .safeAreaInset(edge: .bottom, content: {
                    ctaButton
                })
                .padding(24)
                .toolbar(.hidden, for: .navigationBar)
    }
    
    func onFinishButtonPressed() {
        // other logic to complete onboarding...
        isCompletingProfileSetup = true
        
        Task {
            // try await saveUserProfile(color: selectedTheme)
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private var ctaButton: some View {
        AsyncCallToActionButton(
            isLoading: isCompletingProfileSetup,
            title: "Finish",
            action: onFinishButtonPressed
        )
    }
}

#Preview {
    OnboardingCompletedView(selectedTheme: .mint)
        .environment(AppState())
}
