//
//  Pen.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import Foundation

import UIKit


class Pen {
    
    var fillColor: UIColor?
    var strokeColor: UIColor?
    var strokeWidth: CGFloat?
    
    init() {}
    
    init(withFillColor fillColor: UIColor?,
         withStrokeColor strokeColor: UIColor?,
         withStrokeWidth strokeWidth: CGFloat?) {
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
    }
    
}
