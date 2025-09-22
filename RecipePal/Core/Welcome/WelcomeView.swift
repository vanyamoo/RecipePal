//
//  WelcomeView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Welcome")
                    .frame(maxHeight: .infinity)
                
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get Started")
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
}

#Preview {
    WelcomeView()
}
