//
//  OnboardingCompletedView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 22/09/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            
            ctaButton
        }
        .padding(16)
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
