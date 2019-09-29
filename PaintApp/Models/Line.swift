//
//  Line.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation


import UIKit


class Line : Path, Drawable {
    
    var startPosition: CGPoint
    var endPosition: CGPoint
    
    init(withStartPosition startPosition: CGPoint,
         withEndPosition endPosition: CGPoint,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        
        self.startPosition = startPosition
        self.endPosition = endPosition
        
        super.init(withStrokeColor: strokeColor, withStrokeWidth: strokeWidth)
    }
    
    func drawIt() {
        let path = UIBezierPath()
        path.move(to: startPosition)
        path.addLine(to: endPosition)
        super.drawPath(path: path)
    }

}
