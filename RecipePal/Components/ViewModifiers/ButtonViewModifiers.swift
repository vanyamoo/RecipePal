//
//  ButtonViewModifiers.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 01/10/2025.
//

import SwiftUI

struct HightlightButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay {
                configuration.isPressed ? Color.accent.opacity(0.3) : Color.accent.opacity(0)
            }
            .animation(.smooth, value: configuration.isPressed)
    }
}

extension View {
    func highlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HightlightButtonStyle())
    }
}

#Preview {
    
    VStack(spacing: 24) {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .highlightButton {
                // action
            }
        
        Button {
            // action
        } label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
        Button {
            // action
        } label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .callToActionButton()
        }
    }
    .padding(24)
}
