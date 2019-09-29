//
//  Shapes.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Shapes {
    
    static func circleFromTwoPoints(withPen pen: Pen, withStartPoint startPoint: CGPoint, withEndPoint endPoint: CGPoint) -> Drawable {
        let radius = min(
            abs(endPoint.x - startPoint.x) / 2,
            abs(endPoint.y - startPoint.y) / 2
        )
        
        let centerX = endPoint.x > startPoint.x ?
            startPoint.x + radius : startPoint.x - radius
        let centerY = endPoint.y > startPoint.y ?
            startPoint.y + radius : startPoint.y - radius
        
        let circle = Circle(
            withCenter: CGPoint(x: centerX, y: centerY),
            withRadius: radius,
            withFillColor: pen.fillColor,
            withStrokeColor: pen.strokeColor,
            withStrokeWidth: pen.strokeWidth)
        
        return circle
    }
    
    static func rectangleFromTwoPoints(withPen pen: Pen, withStartPoint startPoint: CGPoint, withEndPoint endPoint: CGPoint) -> Drawable {
        
        let width = endPoint.x - startPoint.x
        let height = endPoint.y - startPoint.y
        
        let rectangle = Rectangle(
            withPosition: startPoint,
            withWidth: width,
            withHeight: height,
            withFillColor: pen.fillColor,
            withStrokeColor: pen.strokeColor,
            withStrokeWidth: pen.strokeWidth)
        
        return rectangle
    }
    
    static func rightTriangleFromTwoPoints(withPen pen: Pen, withStartPoint startPoint: CGPoint, withEndPoint endPoint: CGPoint) -> Drawable {

        let rectangle = RightTriangle(
            withLeftTopCorner: startPoint,
            withRightBottomCorner: endPoint,
            withFillColor: pen.fillColor,
            withStrokeColor: pen.strokeColor,
            withStrokeWidth: pen.strokeWidth)
        
        return rectangle
    }
    
    static func lineFromTwoPoints(withPen pen: Pen, withStartPoint startPoint: CGPoint, withEndPoint endPoint: CGPoint) -> Drawable {
        
        let line = Line(
            withStartPosition: startPoint,
            withEndPosition: endPoint,
            withStrokeColor: pen.strokeColor,
            withStrokeWidth: pen.strokeWidth)
        
        return line
    }
    
}
