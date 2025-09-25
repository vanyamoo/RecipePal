//
//  OnboardingThemeView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 25/09/2025.
//

import SwiftUI

struct OnboardingThemeView: View {
    
    private var profileThemes: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
                alignment: .center,
                spacing: 16,
                pinnedViews: .sectionHeaders,
                content: {
                    Section(content: {
                        ForEach(profileThemes, id: \.self) { color in
                            Circle()
                                .fill(color)
                        }
                    }, header: {
                        Text("Select a profile theme")
                            .font(.headline)
                    })
                }
            )
            .padding(.horizontal, 24)
                
        }
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                ctaButton
                    .padding(24)
            }
        )
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    OnboardingThemeView()
}
