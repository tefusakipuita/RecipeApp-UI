//
//  RecipeInteractionView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct RecipeImageView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    var recipe: RecipeItem
    
    var currentIndex: Int
    var allRecipeCount: Int
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - 周りの円
            Circle()
                .stroke(lineWidth: 4)
                .fill(
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: manager.currentRecipeIndex % 2 == 0 ?  Color.white.opacity(0.01) : Color.darkBg2.opacity(0.01), location: 0),
                        .init(color: recipe.recipeColor, location: 0.45)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing)
                )
                .frame(width: UIScreen.screeenWidth - 32, height: UIScreen.screeenWidth - 32)
                .scaleEffect(1.15)
            
            // MARK: - やじるし
            ArrowShape(reachedTop: currentIndex == 0, reachedBottom: currentIndex == allRecipeCount - 1)
                .stroke(Color.arrow, style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .frame(width: UIScreen.screeenWidth - 32, height: UIScreen.screeenWidth - 32)
                .scaleEffect(1.15)
            
            // MARK: - 料理画像
            Image(recipe.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screeenWidth - 32, height: UIScreen.screeenWidth - 32)
            
            // MARK: - ドラッグ用の透明サークル
            Circle()
                .fill(Color.black.opacity(0.0001))
                .frame(width: UIScreen.screeenWidth - 32, height: UIScreen.screeenWidth - 32)
                .scaleEffect(1.2)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged({ value in
                            manager.changeSwipeValue(translation: value.translation.height)
                        })
                        .onEnded({ value in
                            manager.swipeEnded(translation: value.translation.height)
                        })
                ) //: gesture

        } //: ZStack
    }
}

// MARK: - Preview

struct RecipeInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

