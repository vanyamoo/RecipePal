//
//  OnboardingThemeView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 25/09/2025.
//

import SwiftUI

struct OnboardingThemeView: View {
    
    @State var selectedColor: Color?
    private var profileThemes: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    
    var body: some View {
        ScrollView {
            
            colorGrid
                .padding(.horizontal, 24)
                
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 16, content: {
                ZStack {
                    if let selectedColor {
                        ctaButton(selectedTheme: selectedColor)
                            .transition(.move(edge: .bottom))
                    }
                }
                .padding(24)
            }
        )
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for : .navigationBar)
    }
    
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: .sectionHeaders,
            content: {
                Section(content: {
                    ForEach(profileThemes, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay(
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10 : 0)
                            )
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }, header: {
                    Text("Select a profile theme")
                        .font(.headline)
                })
            }
        )
    }
    
    private func ctaButton(selectedTheme: Color) -> some View {
        NavigationLink {
            if let selectedColor {
                OnboardingCompletedView(selectedTheme: selectedColor)
            }
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingThemeView()
    }
}
