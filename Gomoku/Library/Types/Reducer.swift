//
//  Reducer.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

struct Reducer<Value> {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias ValueType = Value
    typealias FunctionType = (Value, Value) -> Value
    
    // MARK: -
    // MARK: Properties
    
    var empty: ValueType
    var function: FunctionType
    
    // MARK: -
    // MARK: Init and Deinit
    
    init(empty: ValueType, function: @escaping FunctionType) {
        self.empty = empty
        self.function = function
    }
}

extension Reducer where Value == Bool {
    static var or: Reducer {
        return self.init(empty: false) { $0 || $1 }
    }
    
    static var and: Reducer {
        return self.init(empty: true) { $0 && $1 }
    }
}
