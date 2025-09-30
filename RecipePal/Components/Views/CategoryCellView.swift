//
//  CategoryCellView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 30/09/2025.
//

import SwiftUI

struct CategoryCellView: View {
    
    var title: String = "Cooking with Kids"
    var titleFont: Font = .title2
    var imageName: String = Constants.randomImage
    var cornerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(title)
                    .font(titleFont)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingGradientBackgroundForText()
            }
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        
        CategoryCellView()
            .frame(width: 300)
    }
}
