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
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .background(.accent)
                    .cornerRadius(16)
            }
        }
        .padding(16)
    }
}

#Preview {
    OnboardingCompletedView()
}
