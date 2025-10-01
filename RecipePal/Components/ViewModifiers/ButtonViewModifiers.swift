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

struct PressableButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.smooth, value: configuration.isPressed)
    }
}

enum ButtonStyleOption {
    case highlight
    case press
    case plain
}

extension View {
    
    @ViewBuilder
    func anyButton(_ option: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
        switch option {
        case .highlight:
            self.highlightButton(action: action)
        case .press:
            self.pressableButton(action: action)
        case .plain:
            self.plainButton(action: action)
        }
    }
    
    private func highlightButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(HightlightButtonStyle())
    }
    
    private func pressableButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PressableButtonStyle())
    }
    
    private func plainButton(action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            self
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    
    VStack(spacing: 24) {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .frame(maxWidth: .infinity)
            .tappableBackground()
            .anyButton(.highlight) {
                // action
            }
        
        Button {
            // action
        } label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .callToActionButton()
                .anyButton(.press) {
                    // action
                }
        }
        
        Button {
            // action
        } label: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .callToActionButton()
                .anyButton {
                    // action
                }
        }
    }
    .padding(24)
}
