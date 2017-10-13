//
//  BoardPresenter.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import UIKit

class BoardPresenter {
    
    // MARK: -
    // MARK: Public
    
    func gridLines(count: Int, cellSize: CGFloat, boardSize: CGFloat) -> [Line] {
        let axis = (cellSize, boardSize - cellSize)
        let position: (Int) -> CGFloat = { CGFloat($0) * cellSize }
        
        return [
            (Line.horizontal, { position($0) + axis }),
            (Line.vertical, { axis + position($0) })
        ]
            .flatMap {
                (1..<count).map($1 • $0)
            }
    }
    
    func stones(cellSize: CGFloat, radius: CGFloat, board: BoardState) -> [(circle: Circle, player: Player)] {
        let intersections = intersperse(0..<board.width, 0..<board.height)
        
        let players = intersections.map(
            board.get • { $0.value }
        )
        
        let center: (Int) -> CGFloat = { CGFloat($0 + 1) * cellSize }
        
        let circles = intersections.map(
            { (center($0), center($1)) } • CGPoint.init • { Circle(center: $0, radius: radius) }
        )
        
        return zip(circles, players).flatMap { circle, player in
            player.map { (circle, $0) }
        }
    }
}
