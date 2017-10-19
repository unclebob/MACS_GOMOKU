//
//  Line.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import UIKit

struct Line {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias ValueType = CGFloat
    typealias PointType = CGPoint
    
    // MARK: -
    // MARK: Static
    
    static func vertical(x1: ValueType, x2: ValueType, y: ValueType) -> Line {
        return self.init(PointType(x: x1, y: y), PointType(x: x2, y: y))
    }
    
    static func horizontal(x: ValueType, y1: ValueType, y2: ValueType) -> Line {
        return self.init(PointType(x: x, y: y1), PointType(x: x, y: y2))
    }
    
    // MARK: -
    // MARK: Properties
    
    let start: PointType
    let end: PointType
    
    // MARK: -
    // MARK: Init and Deinit
    
    init(_ start: PointType, _ end: PointType) {
        (self.start, self.end) = (start, end)
    }
}

extension Line: Equatable {
    public static func ==(lhs: Line, rhs: Line) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}
