//
//  Tuple.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

func intersperse<A: Collection, B: Collection>(_ lhs: A, _ rhs: B) -> [(A.Iterator.Element, B.Iterator.Element)] {
    return lhs.flatMap { lhs in
        rhs.map { (lhs, $0) }
    }
}

func + <A, B, C>(lhs: (A, B), rhs: C) -> (A, B, C) {
    return (lhs.0, lhs.1, rhs)
}

func + <A, B, C>(lhs: A, rhs: (B, C)) -> (A, B, C) {
    return (lhs, rhs.0, rhs.1)
}

func reverse<A, B>(_ value: (A, B)) -> (B, A) {
    return (value.1, value.0)
}
