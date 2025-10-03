//
//  ChatRowCellView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 03/10/2025.
//

import SwiftUI

struct ChatRowCellView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alien"
    var subtitle: String? = "Hello! How are you?"
    var hasNewChat: Bool = false
    
    var body: some View {
        HStack {
            
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        .aspectRatio(contentMode: .fit)
                } else {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.5))
                }
            }
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title ?? "")
                    .font(.headline)
                
                Text(subtitle ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .font(Font.caption)
                    .fontWeight(.bold)
                    .cornerRadius(10)
            }
                
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(.systemBackground))
    }
}

#Preview {
    
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView()
                .removeListRowFormatting()
            
            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()
            
            ChatRowCellView(subtitle: nil, hasNewChat: true)
                .removeListRowFormatting()
            
            ChatRowCellView(title: nil)
                .removeListRowFormatting()
        }
    }
}
