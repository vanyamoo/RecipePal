//
//  CustomListCellView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 01/10/2025.
//

import SwiftUI

struct CustomListCellView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Playdate ideas"
    var subtitle: String? = "Recipe for a snack that takes 15 min"
    
    var body: some View {
        HStack {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        
                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.4))
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(height: 60)
            .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }
                
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .padding(.vertical, 4)
        .background(Color(.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        VStack {
            CustomListCellView()
            CustomListCellView(title: nil)
            CustomListCellView(imageName: nil)
            CustomListCellView(subtitle: nil)
        }
    }
}
