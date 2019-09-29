//
//  ViewController.swift
//  PaintApp
//
//  Created by Theodore Teddy on 9/28/19.
//  Copyright © 2019 Theodore Teddy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    enum ColorType {
        
        case FILL
        case STROKE
        
    }
    
    @IBOutlet var boardView: BoardView!
    @IBOutlet weak var colorContainer: UIView!
    @IBOutlet weak var fillColor: UIButton!
    @IBOutlet weak var strokeColor: UIButton!
    @IBOutlet weak var strokeWidth: UIStepper!
    @IBOutlet weak var strokeWidthDisplay: UILabel!
    
    private var colorType = ColorType.FILL
    
    var startPoint: CGPoint?
    var endPoint: CGPoint!
    var pen: Pen = Pen()
    var selected = 1
    var points: [CGPoint] = []
    
    var tools: [Int: (
        _ pen: Pen,
        _ startPoint: CGPoint,
        _ endPoint: CGPoint
    ) -> Drawable] = [
        
        1: Shapes.circleFromTwoPoints,
        2: Shapes.rectangleFromTwoPoints,
        3: Shapes.lineFromTwoPoints,
        4: Shapes.rightTriangleFromTwoPoints
        
    ]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            startPoint = touch.location(in: boardView)
            
            pen.fillColor = fillColor.backgroundColor
            if let width = Int(strokeWidthDisplay.text!) {
                if width > 0 {
                    pen.strokeColor = strokeColor.backgroundColor
                    pen.strokeWidth = CGFloat(width)
                } else {
                    pen.strokeColor = nil
                    pen.strokeWidth = nil
                }
            }
            
            if selected == 5, let point = startPoint {
                points = [point]
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            endPoint = touch.location(in: boardView)
            if selected != 5 {
                if let wrappedStartPoint = startPoint {
                    if let tool = tools[selected] {
                        boardView.ghostDrawables = [
                            Selection(
                                withStartPoint: wrappedStartPoint,
                                withEndPoint: endPoint
                            ),
                            tool(pen, wrappedStartPoint, endPoint)
                        ]
                    }
                }
            } else {
                points.append(endPoint)
                boardView.ghostDrawables = [
                    CustomDraw(
                        withPoints: points,
                        withStrokeColor: pen.strokeColor,
                        withStrokeWidth: pen.strokeWidth
                    )
                ]
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let drawable = boardView.ghostDrawables.popLast() {
            boardView.ghostDrawables = []
            boardView.drawables.append(drawable)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        selected = sender.tag
    }
    
    @IBAction func colorClicked(_ sender: UIButton) {
        
        if colorType == .FILL {
            fillColor.backgroundColor = sender.backgroundColor
        } else {
            strokeColor.backgroundColor = sender.backgroundColor
        }
        
    }
    
    @IBAction func colorPickerTypeClicked(_ sender: UIButton) {
        
        if sender.tag == 1 {
            colorType = .FILL
            colorContainer.bringSubviewToFront(fillColor)
        } else {
            colorType = .STROKE
            colorContainer.bringSubviewToFront(strokeColor)
        }
        
    }
    
    @IBAction func strokeWidthChanged(_ sender: UIStepper) {
        strokeWidthDisplay.text = String(Int(sender.value))
    }
    
    
    @IBAction func back(_ sender: Any) {
        if boardView.drawables.count > 0 {
            boardView.drawables.removeLast()
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        boardView.drawables = []
    }
    
}


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

