//
//  RecipeItem.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct RecipeItem: Identifiable {
    
    var id = UUID()
    var title: String
    var description: String
    var imageName: String  // 料理の画像名
    var summery: [String: String]  // [画像名 : タイトル]
    var ingredients: [Ingredients]
    var instructions: [String]
    var recipeColor: Color
}
