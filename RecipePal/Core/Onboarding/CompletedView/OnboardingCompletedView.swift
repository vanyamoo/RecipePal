//
//  OnboardingCompletedView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 22/09/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
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
    }
    
    func onFinishButtonTapped() {
        // other logic to complete onboarding...
        root.updateViewState(showTabBarView: true)
    }
    
    private var ctaButton: some View {
        Button {
            onFinishButtonTapped()
        } label: {
            Text("Finish")
                .callToActionButton()
        }
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
