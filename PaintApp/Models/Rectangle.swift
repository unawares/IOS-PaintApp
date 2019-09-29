//
//  Rectangle.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Rectangle : Shape, Drawable {
    
    var position: CGPoint
    var width: CGFloat
    var height: CGFloat
    
    init(withPosition position: CGPoint,
         withWidth width: CGFloat,
         withHeight height: CGFloat,
         withFillColor fillColor: UIColor?,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        self.position = position
        self.width = width
        self.height = height
        super.init(withFillColor: fillColor, withStrokeColor: strokeColor, withStrokeWidth: strokeWidth)
    }
    
    func drawIt() {
        let path = UIBezierPath(rect: CGRect(x: position.x, y: position.y, width: width, height: height))
        super.drawPath(path: path)
    }

}
