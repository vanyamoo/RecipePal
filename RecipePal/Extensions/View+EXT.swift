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
    
    func tappableBackground() -> some View {
        background(.black.opacity(0.001))
    }
    
    func removeListRowFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
}
