//
//  OnboardingIntroView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 25/09/2025.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Make your own ")
                +
                Text("recipe assistants ")
                    .fontWeight(.semibold)
                    .foregroundStyle(.accent)
                +
                Text("and chat with them!\n\nHave ")
                +
                Text("real conversations ")
                    .fontWeight(.semibold)
                    .foregroundStyle(.accent)
                +
                Text("with AI generated responses.")
            }
            .frame(maxHeight: .infinity)
            .baselineOffset(6)
            .padding(24)
            
            ctaButton
        }
        .padding(24)
        .font(.title3)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnboardingThemeView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    OnboardingIntroView()
}
