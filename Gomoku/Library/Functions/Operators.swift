//
//  Operators.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

precedencegroup CompositionPrecedence {
    associativity: right
    higherThan: ApplyPrecedence
}

precedencegroup ApplyPrecedence {
    associativity: left
    higherThan: BitwiseShiftPrecedence
}

infix operator • : CompositionPrecedence
infix operator |> : ApplyPrecedence
