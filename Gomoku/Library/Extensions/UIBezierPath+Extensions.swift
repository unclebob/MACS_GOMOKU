//
//  UIBezierPath+Extensions.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import UIKit

extension UIBezierPath {
    
    // MARK: -
    // MARK: Init and Deinit
    
    convenience init(_ line: Line) {
        self.init()
        
        self.move(to: line.start)
        self.addLine(to: line.end)
    }
    
    convenience init(_ circle: Circle) {
        self.init()
        
        let center = circle.center
        self.move(to: center)
        self.addArc(
            withCenter: center,
            radius: circle.radius,
            startAngle: 0,
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
        self.close()
    }
    
    // MARK: -
    // MARK: Public
    
    func add(_ line: Line) {
        self.append(UIBezierPath(line))
    }
    
    func add(_ circle: Circle) {
        self.append(UIBezierPath(circle))
    }
}
