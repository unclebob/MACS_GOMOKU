//
//  Array+Reducer.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

extension Array {
    func join(_ reducer: Reducer<Element>) -> Element {
        return self.reduce(reducer.empty, reducer.function)
    }
    
    func apply<Value, Result>(_ value: Value) -> [Result]
        where Element == (Value) -> Result
    {
        return self.map { $0(value) }
    }
}
