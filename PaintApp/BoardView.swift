//
//  BoardView.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import UIKit


class BoardView: UIView {
    
    var drawables: [Drawable] = [] {
        
        didSet {
            setNeedsDisplay()
        }
        
    }
    
    var ghostDrawables: [Drawable] = [] {
        
        didSet {
            setNeedsDisplay()
        }
        
    }

    override func draw(_ rect: CGRect) {
        for drawable in drawables {
            drawable.drawIt()
        }
        for drawable in ghostDrawables {
            drawable.drawIt()
        }
    }

}
