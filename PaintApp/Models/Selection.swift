//
//  Selection.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Selection : Drawable {
    
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    init(withStartPoint startPoint: CGPoint,
         withEndPoint endPoint: CGPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func drawIt() {
        let cgPath = CGMutablePath()
        cgPath.addLines(between: [
            startPoint,
            CGPoint(x: startPoint.x, y: endPoint.y),
            endPoint,
            CGPoint(x: endPoint.x, y: startPoint.y),
        ])
        cgPath.closeSubpath()
        let path = UIBezierPath.init(cgPath: cgPath)
        let dashes: [CGFloat] = [4, 8]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        path.lineWidth = 1
        path.lineCapStyle = .butt
        path.stroke()
    }
    
}
