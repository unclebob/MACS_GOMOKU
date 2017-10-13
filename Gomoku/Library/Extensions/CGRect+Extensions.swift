//
//  CGRect+Extensions.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    // MARK: -
    // MARK: Properties
    
    var x: CGFloat {
        get { return self.origin.x }
        set { self.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return self.origin.y }
        set { self.origin.y = newValue }
    }
    
    var width: CGFloat {
        get { return self.size.width }
        set { self.size.width = newValue }
    }
    
    var height: CGFloat {
        get { return self.size.height }
        set { self.size.height = newValue }
    }
}
