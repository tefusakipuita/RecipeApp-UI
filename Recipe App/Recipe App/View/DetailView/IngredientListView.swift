//
//  IngredientList.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct IngredientListView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ForEach(manager.data[manager.currentRecipeIndex].ingredients, id: \.title) { ingredient in
                HStack (alignment: .top, spacing: 16) {
                    
                    // MARK: - Pointer Toggle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 2.5)
                            .fill(
                                ingredient.availabel ? manager.data[manager.currentRecipeIndex].recipeColor : Color.gray
                            )
                            .frame(width: 26, height: 26)

                        Circle()
                            .fill(
                                manager.data[manager.currentRecipeIndex].recipeColor
                                    .opacity(ingredient.availabel ? 1 : 0)
                            )
                            .frame(width: 12, height: 12)
                    } //: ZStack
                    .onTapGesture(perform: {
                        withAnimation {
                            ingredient.availabel.toggle()
                        }
                    })
                    
                    // MARK: - Ingredient
                    Text(ingredient.title)
                        .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .recipeTitleColor : .white)
                    
                    Spacer()
                } //: HStack
                .padding(.top, 7)
            }
        } //: VStack
        .padding(.horizontal, 24)
        .transition(.asymmetric(insertion: .move(edge: .leading),
                                removal: .move(edge: .trailing)))
    }
}

// MARK: - Preview

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
