//
//  SummeryView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct SummeryView: View {
    
    // MARK: - Property
    
    var recipe: RecipeItem
    @ObservedObject var manager: RecipeManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24) {
            // [型, 型] の配列を ForEach で分解するためには　sorted(by: <) をつける必要がある (謎)
            ForEach(recipe.summery.sorted(by: <), id: \.key) { (key, value) in
                HStack {
                    Image(systemName: key)
                        .foregroundColor(recipe.recipeColor)
                        .font(.system(size: 18, weight: .light))
                    
                    Text(value)
                        .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .thinColor : .lightBg)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                } //: HStack
                .matchedGeometryEffect(id: key, in: animation, anchor: .leading)
                // アニメーション用
                .rotation3DEffect(
                    manager.isChanged ? Angle(degrees: 90) : Angle(degrees: 0),
                    axis: (x: 10, y: 0, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 1
                )
                .animation(.spring(response: 0.6, dampingFraction: 0.7))
                .offset(y: manager.isChanged ? -20 : 0)
                .opacity(manager.isChanged ? 0 : 1)
                .animation(Animation.linear(duration: 0.2).delay(0.05))
                
            } //: ForEach
        } //: VStack
    }
}

struct SummeryView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
