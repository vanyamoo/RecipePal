//
//  AppView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 17/09/2025.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
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

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}
#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
