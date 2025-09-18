//
//  AppViewBuilder.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 18/09/2025.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    
    var showTabBar: Bool
    @ViewBuilder var tabBarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showTabBar {
                tabBarView
                .transition(.move(edge: .trailing))
            } else {
                onboardingView
                .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct AppViewPreview: View {
    
    var showTabBar: Bool
    
    var body: some View {
        
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("TabBar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
    }
}

#Preview {
    AppViewPreview(showTabBar: false)
}
