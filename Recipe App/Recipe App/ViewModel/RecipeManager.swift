//
//  RecipeManager.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

class RecipeManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var data = Data.recipes
    
    // 詳細用のん
//    @Published var selectedRecipe: RecipeItem? = Data.recipes[0]
    @Published var selectedRecipe: RecipeItem? = nil
    
    // 現在選択状態のレシピのインデックス番号
    @Published var currentRecipeIndex = 0
    
    @Published var swipeHeight: CGFloat = 0
    
    @Published var isChanged = false
    
    
    // MARK: - Function
    
    func changeSwipeValue(translation: CGFloat) {
        swipeHeight = translation / 2.5
    }
    
    func swipeEnded(translation: CGFloat) {
        
        // スワイプ成功, 次のレシピに
        if abs(swipeHeight) > 60 {
//            var isChanged = false  // スワイプで currentRecipeIndex を変えるか否か
            
            withAnimation(.spring(response: 1.0, dampingFraction: 0.6)) {
                if swipeHeight > 0 {  // 下にスワイプ
                    // currentRecipeIndex が 3でないなら currentRecipeIndex を変更
                    if currentRecipeIndex != 0 {
                        swipeHeight = 360
                        currentRecipeIndex -= 1
                        isChanged = true
                    }
                }
                else if swipeHeight < 0 {  // 上にスワイプ
                    // currentRecipeIndex が 0でないなら currentRecipeIndex を変更
                    if currentRecipeIndex != data.count - 1 {
                        swipeHeight = -360
                        currentRecipeIndex += 1
                        isChanged = true
                    }
                }
            }
            
            if isChanged {  // currentRecipeIndex を変更するなら
                // スワイプ終了の 0.7秒後に swipeHeight を 0に戻す
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    self.swipeHeight = 0
                }
                
                isChanged = false
            }
            else {  // 変更させる currentRecipeIndex がないなら
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                    swipeHeight = 0
                }
            }
        }
        else {  // 元に戻す
            withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                swipeHeight = 0
            }
        }
    }
}
