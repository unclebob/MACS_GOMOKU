//
//  Circle.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import CoreGraphics

struct Circle {
    let center: CGPoint
    let radius: CGFloat
}

extension Circle: Equatable {
    public static func ==(lhs: Circle, rhs: Circle) -> Bool {
        return lhs.center == rhs.center && lhs.radius == rhs.radius
    }
}
