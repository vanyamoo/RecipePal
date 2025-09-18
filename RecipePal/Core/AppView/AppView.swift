//
//  AppView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 17/09/2025.
//

import SwiftUI

struct AppView: View {
    
    @State private var showTabBar: Bool = false
    
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
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
