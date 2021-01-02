//
//  DetailToggle.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct DetailToggle: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    @Binding var isIngredient: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Toggle Text
            HStack (spacing: 28) {
                Text("Ingredients".uppercased())
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .normalColor : .lightBg)
                    .opacity(isIngredient ? 1 : 0.6)
                    .frame(width: 100)
                    .onTapGesture(perform: {
                        withAnimation(.easeOut) {
                            isIngredient = true
                        }
                    })
                
                Text("Method".uppercased())
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .normalColor : .lightBg)
                    .opacity(isIngredient ? 0.6 : 1)
                    .frame(width: 70)
                    .onTapGesture(perform: {
                        withAnimation(.easeOut) {
                            isIngredient = false
                        }
                    })
                
                Spacer()
            } //: HSatck
            .font(.system(size: 15, weight: .semibold))
            .padding(.horizontal, 24)
            .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .normalColor : .lightBg)
            
            ZStack {
                // MARK: - Under Bar
                Rectangle()
                    .fill(Color.thinColor)
                    .frame(width: UIScreen.screeenWidth, height: 0.5)
                
                // MARK: - Segment Bar
                HStack {
                    Rectangle()
                        .fill(manager.data[manager.currentRecipeIndex].recipeColor)
                        .frame(width: isIngredient ? 100 : 70, height: 3)
                        .offset(x: isIngredient ? 0 : 100 + 28)
                    
                    Spacer()
                } //: HStack
                .padding(.horizontal, 24)
                
            } //: ZStack
            
        } //: VStack
    }
}

// MARK: - Preview

struct DetailToggle_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
