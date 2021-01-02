//
//  RecipeDatailView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct RecipeDatailView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    @State var isIngredient = true
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment:.bottomTrailing) {
            
            // MARK: - Background
            if manager.currentRecipeIndex % 2 == 0 {  // currentRecipeIndex が 0,2 の時
                LinearGradient(gradient: Gradient(colors: [.white, .lightBg]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.asymmetric(insertion: .move(edge: manager.swipeHeight > 0 ? .top : .bottom), removal: .identity))
                    .animation(.linear)
            }
            else  {  // currentRecipeIndex が 1,3 の時
                LinearGradient(gradient: Gradient(colors: [.darkBg1, .darkBg2]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.asymmetric(insertion: .move(edge: manager.swipeHeight > 0 ? .top : .bottom), removal: .identity))
                    .animation(.linear)
            }
            
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading) {
                    
                    // MARK: - Recipe Image View
                    RecipeImageView(manager: manager, recipe: manager.data[manager.currentRecipeIndex], currentIndex: manager.currentRecipeIndex, allRecipeCount: manager.data.count)
                        .frame(width: UIScreen.screeenWidth)
                        .scaleEffect(CGFloat(1 / 1.1))
//                        .rotationEffect(Angle(degrees: 90))
                        .rotationEffect(manager.selectedRecipe != nil ? Angle(degrees: 90) : Angle(degrees: 0))
                        .padding(.top, -100)
                        .matchedGeometryEffect(id: "dishImage", in: animation)
                    
                    // MARK: - Title
                    Text(manager.data[manager.currentRecipeIndex].title)
                        .font(.system(size: 32, weight: .semibold, design: .serif))
                        .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .recipeTitleColor : .white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 40)
                        .padding(.horizontal, 24)
                        .matchedGeometryEffect(id: manager.data[manager.currentRecipeIndex].title, in: animation, anchor: .topLeading)
                        .animation(.easeOut(duration: 0.4))
                        
                    
                    // MARK: - Ingredient / Step Toggle View
                    DetailSummeryView(manager: manager, animation: animation)
                        .padding(.top, 25)
                        .padding(.horizontal, 24)
                    
                    // MARK: - Menu Toggle
                    DetailToggle(manager: manager, isIngredient: $isIngredient)
                        .padding(.top, 25)
                
                    if isIngredient {
                        // MARK: - Ingredient List
                        IngredientListView(manager: manager)
                    }
                    else {
                        // MARK: - Steps List
                        StepListView(manager: manager)
                    }
                        
                
                } //: VStack
            } //: Scroll
            
            // MARK: - Back Button
            Button(action: {
                withAnimation (.easeOut) {
                    manager.selectedRecipe = nil
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(manager.data[manager.currentRecipeIndex].recipeColor)
                        .frame(width: 50, height: 50)
                        .rotationEffect(Angle(degrees: 45))
                        .shadow(color: manager.data[manager.currentRecipeIndex].recipeColor.opacity(0.35), radius: 20, y: 30)
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                } //: ZStack
            }) //: Button
            .padding(.bottom, 60)
            .padding(.trailing, 26)
        } //: ZStack
    }
}

struct RecipeDatailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
