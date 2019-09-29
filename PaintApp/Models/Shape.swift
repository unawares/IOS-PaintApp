//
//  Shape.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Shape {
    
    var strokeWidth: CGFloat?
    var strokeColor: UIColor?
    var fillColor: UIColor?
    
    init(withFillColor fillColor: UIColor?,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }
    
    func drawPath(path: UIBezierPath) {
        if let wrappedStrokeWidth = strokeWidth, let wrappedStrokeColor = strokeColor {
            path.lineWidth = wrappedStrokeWidth
            wrappedStrokeColor.setStroke()
            path.stroke()
        }
        if let wrappedFillColor = fillColor {
            wrappedFillColor.setFill()
            path.fill()
        }
    }
    
}
