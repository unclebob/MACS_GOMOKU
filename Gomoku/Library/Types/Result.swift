//
//  Result.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import Foundation

func liftValue<Value, Error>(_ value: Value) -> Result<Value, Error> {
    return .success(value)
}

func liftError<Value, Error>(_ error: Error) -> Result<Value, Error> {
    return .failure(error)
}

enum Result<Value, Error: Swift.Error> {
    
    //MARK: -
    //MARK: Cases
    
    case success(Value)
    case failure(Error)
    
    //MARK: -
    //MARK: properties
    
    var value: Value? {
        return self.analysis(ifValue: identity, ifError: empty)
    }
    
    var error: Error? {
        return self.analysis(ifValue: empty, ifError: identity)
    }
    
    //MARK: -
    //MARK: Initializations and Deallocations
    
    init(value: Value) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
    
    init(value: Value?, error: @autoclosure () -> Error) {
        self = value.map(Result.success) ?? .failure(error())
    }
    
    //MARK: -
    //MARK: Public methods
    
    func analysis<Result>(ifValue: (Value) -> Result, ifError: (Error) -> Result) -> Result {
        switch self {
        case let .success(value): return ifValue(value)
        case let .failure(error): return ifError(error)
        }
    }
    
    func bimap<T, E>(ifSuccess: (Value) -> T, ifFailure:  (Error) -> E) -> Result<T, E> {
        return withoutActuallyEscaping(ifSuccess) { ifSuccess in
            withoutActuallyEscaping(ifFailure) {
                return self.biflatMap(ifSuccess: ifSuccess • liftValue, ifFailure: $0 • liftError)
            }
        }
    }
    
    func mapValue<T>(_ transform: (Value) -> T) -> Result<T, Error> {
        return self.bimap(ifSuccess: transform, ifFailure: identity)
    }
    
    func mapError<E>(_ transform: (Error) -> E) -> Result<Value, E> {
        return self.bimap(ifSuccess: identity, ifFailure: transform)
    }
    
    func biflatMap<T, E>(ifSuccess: (Value) -> Result<T, E>, ifFailure: (Error) -> Result<T, E>) -> Result<T, E> {
        return self.analysis(ifValue: ifSuccess, ifError: ifFailure)
    }
    
    func flatMapValue<T>(transform: (Value) -> Result<T, Error>) -> Result<T, Error> {
        return self.biflatMap(ifSuccess: transform, ifFailure: liftError)
    }
    
    func flatMapError<E>(transform: (Error) -> Result<Value, E>) -> Result<Value, E> {
        return self.biflatMap(ifSuccess: liftValue, ifFailure: transform)
    }
}
