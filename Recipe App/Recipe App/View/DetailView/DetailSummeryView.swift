//
//  DetailSummeryView.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct DetailSummeryView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: RecipeManager
    
    var animation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 26) {
            HStack {
                Image(systemName: "alarm")
                    .foregroundColor(manager.data[manager.currentRecipeIndex].recipeColor)
                    .font(.system(size: 18, weight: .light))
                
                Text((manager.data[manager.currentRecipeIndex].summery["alarm"])!)
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .thinColor : .lightBg)
                    .font(.system(size: 18, weight: .medium))
            } //: HStack
            .matchedGeometryEffect(id: "alarm", in: animation, anchor: .leading)
            .animation(.easeOut(duration: 0.4))
            
            HStack {
                Image(systemName: "chart.bar.doc.horizontal")
                    .foregroundColor(manager.data[manager.currentRecipeIndex].recipeColor)
                    .font(.system(size: 18, weight: .light))
                
                Text((manager.data[manager.currentRecipeIndex].summery["chart.bar.doc.horizontal"])!)
                    .foregroundColor(manager.currentRecipeIndex % 2 == 0 ? .thinColor : .lightBg)
                    .font(.system(size: 18, weight: .medium))
            } //: HStack
            .matchedGeometryEffect(id: "chart.bar.doc.horizontal", in: animation, anchor: .leading)
            .animation(.easeOut(duration: 0.4))
        } //: HStack
    }
}

// MARK: - Preview

struct DetailSummeryView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
