//
//  ImageLoaderView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 24/09/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString = "https://picsum.photos/200/300"
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
