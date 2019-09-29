//
//  Circle.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Circle : Shape, Drawable {
    
    var center: CGPoint
    var radius: CGFloat
    
    init(withCenter center: CGPoint,
         withRadius radius: CGFloat,
         withFillColor fillColor: UIColor?,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        
        self.center = center
        self.radius = radius
        
        super.init(withFillColor: fillColor, withStrokeColor: strokeColor, withStrokeWidth: strokeWidth)
    }
    
    func drawIt() {
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
        super.drawPath(path: path)
    }
    
}
