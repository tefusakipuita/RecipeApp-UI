//
//  StepList.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct StepListView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(manager.data[manager.currentRecipeIndex].instructions, id: \.self) { method in
                
                // MARK: - Method
                Text(method)
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .recipeTitleColor : .white)
                    .padding(.top, 5)
                
                // MARK: - Devider Bar
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: manager.data[manager.currentRecipeIndex].recipeColor, location: 0.4),
                            .init(color: manager.data[manager.currentRecipeIndex].recipeColor.opacity(0.001), location: 1)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing)
                    )
                    .frame(width: 140, height: 1.4)
                    .offset(x: -8)
            }
        } //: VStack
        .padding(.horizontal, 24)
        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
    }
}

// MARK: - Preview

struct StepList_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
