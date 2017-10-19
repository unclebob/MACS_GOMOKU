//
//  Weakify.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

func weakify<Value: AnyObject, Arguments, Result>(
    _ function: @escaping (Value) -> (Arguments) -> Result,
    object: Value,
    default value: Result
)
    -> (Arguments) -> Result
{
    return { [weak object] arguments in
        object.map { function($0)(arguments) } ?? value
    }
}

func weakify<Value: AnyObject, Arguments>(
    _ function: @escaping (Value) -> (Arguments) -> (),
    object: Value
)
    -> (Arguments) -> ()
{
    return weakify(function, object: object, default: ())
}
