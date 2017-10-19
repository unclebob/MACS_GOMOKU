//
//  Flow.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import Foundation

func sideEffect<Value>(_ execute: @escaping (Value) -> ()) -> (Value) -> Value {
    return {
        execute($0)
        
        return $0
    }
}

func scope(_ execute: () -> ()) {
    execute()
}

func identity<Value>(_ value: Value) -> Value {
    return value
}

func empty<Value, Result>(_ value: Value) -> Result? {
    return nil
}

func void<Value>(_ value: Value) {

}

func • <A, B, C>(lhs: @escaping (A) -> B, rhs: @escaping (B) -> C) -> (A) -> C {
    return { rhs(lhs($0)) }
}

func |> <A, B>(value: A, function: (A) -> B) -> B {
    return function(value)
}
