//
//  Extension.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/02.
//

import SwiftUI


// MARK: - Color
extension Color {
    
    static let lightBg = Color("lightBg")
    static let darkBg1 = Color("darkBg1")
    static let darkBg2 = Color("darkBg2")
    
    static let arrow = Color("arrow")
    
    static let questColor = Color("questColor")
    static let recipeTitleColor = Color("recipeTitleColor")
    static let thinColor = Color("thinColor")
    static let normalColor = Color("normalColor")
}


// MARK: - CGPoint

extension CGPoint {
    
    //  『中心点・半径・角度』 から CGPoint を算出するためのメソッド
    static func pointOnCircle(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        
        return CGPoint(x: x, y: y)
    }
}


// MARK: - UIScreen
extension UIScreen {
    
    static let screeenWidth = UIScreen.main.bounds.width
    static let screeenHeight = UIScreen.main.bounds.height
    
    static let screenSize = UIScreen.main.bounds.size
}
