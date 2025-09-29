//
//  CarouselView.swift
//  RecipePal
//
//  Created by Vanya Mutafchieva on 29/09/2025.
//

import SwiftUI

struct CarouselView: View {
    
    var items: [RecipeAssistantModel] = RecipeAssistantModel.mocks
    @State var selection: RecipeAssistantModel?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        HeroCellView(
                            title: item.name,
                            subtitle: item.description,
                            imageName: item.profileImageName
                        )
                        .containerRelativeFrame(.horizontal) // Makes the view take up the full width
                        .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in // main effect logic
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                        })
                        .id(item)
                    }
                }
                .scrollTargetLayout() // Essential: Defines the layout items for paging
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging) // Forces the ScrollView to snap from one item to the next
            .scrollPosition(id: $selection)
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }
            
            HStack {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(selection == item ? .accent : .secondary.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    CarouselView()
        .padding()
}
