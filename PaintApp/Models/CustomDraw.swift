//
//  CustomDraw.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/29/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class CustomDraw : Path, Drawable {
    
    var points: [CGPoint] = []
    
    init(withPoints points: [CGPoint],
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        
        self.points = points
        
        super.init(withStrokeColor: strokeColor, withStrokeWidth: strokeWidth)
    }
    
    func drawIt() {
        if points.count > 0 {
            let path = UIBezierPath()
            path.move(to: points[0])
            var index = 1
            while index < points.count {
                path.addLine(to: points[index])
                index += 1
            }
            super.drawPath(path: path)
        }
    }

}
