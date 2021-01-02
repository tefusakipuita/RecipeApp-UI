//
//  RecipeOverView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct RecipeOverView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            VStack (alignment: .leading, spacing: 10) {
                
                // MARK: - Title View
                TitleView(manager: manager, animation: animation)
                    .padding(.top, 60)
                
                Spacer()
                
                // MARK: - Description View
                DescriptionView(recipe: manager.data[manager.currentRecipeIndex], manager: manager, animation: animation)
                    .padding(.bottom, 40)
                
            } //: VStack
            
            // MARK: - Interaction View with Image
            RecipeImageView(manager: manager, recipe: manager.data[manager.currentRecipeIndex],
                                  currentIndex: manager.currentRecipeIndex,
                                  allRecipeCount: manager.data.count)
                .matchedGeometryEffect(id: "dishImage", in: animation)
                .rotationEffect(manager.selectedRecipe != nil ? Angle(degrees: 0) : Angle(degrees: -360))
                
                // アニメーション用
                .rotationEffect(Angle(degrees: Double(-manager.swipeHeight)))
                .offset(x: UIScreen.screeenWidth / 2)
            
            // MARK: - Summery View
            SummeryView(recipe: manager.data[manager.currentRecipeIndex], manager: manager, animation: animation)
            
        } //: ZStack
    }
}

struct RecipeOverView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
