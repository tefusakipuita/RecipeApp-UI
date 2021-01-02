//
//  TitleView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct TitleView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text("Daily Cooking Quest".uppercased())
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.thinColor)
                
                Text(manager.data[manager.currentRecipeIndex].title)
                    .font(.system(size: 32, weight: .semibold, design: .serif))
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .recipeTitleColor : .white)
                    // アニメーション用
                    .matchedGeometryEffect(id: manager.data[manager.currentRecipeIndex].title, in: animation, anchor: .bottomTrailing)
                    .animation(.easeOut(duration: 0.4))
                    .offset(y: manager.isChanged ? -20 : 0)
                    .opacity(manager.isChanged ? 0 : 1)
                    .animation(Animation.linear(duration: 0.5).delay(0.1))
                    
            } //: VStack
            
            Spacer()
        } //: HStack
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
