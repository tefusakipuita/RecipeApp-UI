//
//  DescriptionView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct DescriptionView: View {
    
    // MARK: - Property
    
    var recipe: RecipeItem
    @ObservedObject var manager: RecipeManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            Text(recipe.description)
                .frame(width: UIScreen.screeenWidth - 140)
                .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .normalColor : .lightBg)
                // アニメーション用
                .offset(y: manager.isChanged ? -20 : 0)
                .opacity(manager.isChanged ? 0 : 1)
                .animation(.linear(duration: 0.4))
            
            Spacer()
            
            Button(action: {
                withAnimation (.easeOut) {
                    manager.selectedRecipe = manager.data[manager.currentRecipeIndex]
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(recipe.recipeColor)
                        .frame(width: 50, height: 50)
                        .rotationEffect(Angle(degrees: 45))
                        .shadow(color: recipe.recipeColor.opacity(0.35), radius: 20, y: 30)
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                } //: ZStack
            }) //: Button
        } //: HStack
        .padding(.trailing, 24)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
