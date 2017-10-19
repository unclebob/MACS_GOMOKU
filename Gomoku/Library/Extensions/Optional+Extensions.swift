//
//  Optional+Extensions.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

extension Optional {
    func `do`(_ action: (Wrapped) -> ()) {
        self.map(action)
    }
}
