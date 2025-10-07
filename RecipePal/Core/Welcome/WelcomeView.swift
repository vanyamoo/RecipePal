//
//  WelcomeView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 19/09/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()
                
                titleSection
                    .padding(.top, 24)
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
            .sheet(isPresented: $showSignInView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }
    
    private var titleSection: some View {
        VStack {
            Text("Recipe Pal")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(" YouTube @RecipePal")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
    }
    
    private var ctaButtons: some View {
        VStack {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign In!")
                .underline()
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
    }
    
    private var policyLinks: some View {
        HStack {
            Link(destination: URL(string: Constants.termsOfServiceURL)!) {
                Text("Terms of Service")
            }
            
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            
            Link(destination: URL(string: Constants.privacyPolicyURL)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
