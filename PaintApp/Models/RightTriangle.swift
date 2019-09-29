//
//  Triangle.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class RightTriangle : Shape, Drawable {
    
    var leftTopCorner: CGPoint
    var rightBottomCorner: CGPoint
    
    init(withLeftTopCorner leftTopCorner: CGPoint,
         withRightBottomCorner rightBottomCorner: CGPoint,
         withFillColor fillColor: UIColor?,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        self.leftTopCorner = leftTopCorner
        self.rightBottomCorner = rightBottomCorner
        super.init(withFillColor: fillColor, withStrokeColor: strokeColor, withStrokeWidth: strokeWidth)
    }
    
    func drawIt() {
        let path = UIBezierPath()
        path.move(to: leftTopCorner)
        path.addLine(to: CGPoint(x: leftTopCorner.x, y: rightBottomCorner.y))
        path.addLine(to: rightBottomCorner)
        path.close()
        super.drawPath(path: path)
    }

}
