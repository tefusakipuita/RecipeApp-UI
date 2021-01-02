//
//  ContentView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Property
    
    @StateObject var manager = RecipeManager()
    
    @Namespace var animation
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            if manager.currentRecipeIndex % 2 == 0 {  // currentRecipeIndex が 0,2 の時
                LinearGradient(gradient: Gradient(colors: [.white, .lightBg]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    // アニメーション用
                    .transition(.asymmetric(insertion: .move(edge: manager.swipeHeight > 0 ? .top : .bottom), removal: .move(edge: manager.swipeHeight > 0 ? .bottom : .top)))
                    .animation(.linear)
            }
            else  {  // currentRecipeIndex が 1,3 の時
                LinearGradient(gradient: Gradient(colors: [.darkBg1, .darkBg2]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    // アニメーション用
                    .transition(.asymmetric(insertion: .move(edge: manager.swipeHeight > 0 ? .top : .bottom), removal: .move(edge: manager.swipeHeight > 0 ? .bottom : .top)))
                    .animation(.linear)
            }
            
            // MARK: - Home View
            RecipeOverView(manager: manager, animation: animation)
                .padding(.leading, 24)
            
            // MARK: - Detail View
            if manager.selectedRecipe != nil {
                RecipeDatailView(manager: manager, animation: animation)
            }
            
        } //: ZStack
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
