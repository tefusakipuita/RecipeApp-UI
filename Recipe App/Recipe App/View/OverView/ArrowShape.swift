//
//  ArrowShape.swift
//  Recipe App
//
//  Created by 中筋淳朗 on 2020/12/03.
//

import SwiftUI

struct ArrowShape: Shape {
    
    // MARK: - Property
    
    let reachedTop: Bool
    let reachedBottom: Bool
    
    
    // MARK: - Main
    func path(in rect: CGRect) -> Path {
        let startAngle: CGFloat = 155  // (180 - 25)
        let endAngle: CGFloat = 205  // (180 + 25)
        
        // ラジアンに変換 (0 ~ 2π)
        // 自作の pointOnCircleメソッド で三角関数(sin, cos)を使うから、そのためにラジアンにしておく
        let startAngleRadian1 = startAngle * .pi / 180
        let endAngleRadian1 = endAngle * .pi / 180
        
        let radius = rect.width / 2  // 半径
        
        // 矢印の両端のCGPoint
        let startPoint1 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                               radius: radius,
                                               angle: startAngleRadian1)
        let endPoint1 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                             radius: radius,
                                             angle: endAngleRadian1)
        
        // MARK: - 矢印の本軸
        var path = Path()
        
        path.addArc(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: Angle(degrees: Double(startAngle)),
                    endAngle: Angle(degrees: Double(endAngle)),
                    clockwise: false)
        
        
        // MARK: - 矢印の端っこ (下の方)
        if !reachedTop {  // 一番上の料理にたどり着くと 下向きの矢印を消す
            let startAngleRadian2 = (startAngle + 2) * .pi / 180
            
            let startPoint2 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                                   radius: radius + 6,
                                                   angle: startAngleRadian2)
            let startPoint3 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                                   radius: radius - 6,
                                                   angle: startAngleRadian2)
            
            path.move(to: startPoint1)
            path.addLine(to: startPoint2)
            
            path.move(to: startPoint1)
            path.addLine(to: startPoint3)
        }
        
        
        // MARK: - 矢印の端っこ (上の方)
        if !reachedBottom {  // 一番下の料理にたどり着くと 上向きの矢印を消す
            let endAngleRadian2 = (endAngle - 2) * .pi / 180
            
            let endPoint2 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                                   radius: radius + 6,
                                                   angle: endAngleRadian2)
            let endPoint3 = CGPoint.pointOnCircle(center: CGPoint(x: radius, y: radius),
                                                   radius: radius - 6,
                                                   angle: endAngleRadian2)
            
            path.move(to: endPoint1)
            path.addLine(to: endPoint2)
            
            path.move(to: endPoint1)
            path.addLine(to: endPoint3)
        }
        
        return path
    }
}
