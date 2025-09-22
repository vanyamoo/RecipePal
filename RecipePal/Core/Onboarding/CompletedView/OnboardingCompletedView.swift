//
//  OnboardingCompletedView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 22/09/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            
            Button {
                // finish onboarding and enter app
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
}

#Preview {
    OnboardingCompletedView()
}
