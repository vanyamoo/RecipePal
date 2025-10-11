//
//  View+EXT.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 22/09/2025.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .font(.headline)
            .foregroundStyle(.white)
            .background(.accent)
            .cornerRadius(16)
    }
    
    func badgeButton() -> some View {
        self
            .font(.caption)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(6)
    }
    
    func tappableBackground() -> some View {
        background(.black.opacity(0.001))
    }
    
    func removeListRowFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    func addingGradientBackgroundForText() -> some View {
        background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .black.opacity(0),
                        .black.opacity(0.3),
                        .black.opacity(0.6)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    @ViewBuilder
    func ifSatisfiedCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
