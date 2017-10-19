//
//  BoardPresenterTest.swift
//  Gomoku
//
//  Created by Oleksa 'trimm' Korin on 10/13/17.
//  Copyright © 2017 Cleancoders. All rights reserved.
//

import XCTest

@testable import Gomoku

class BoardPresenterTest: XCTestCase {
    
    let presenter = BoardPresenter()
    
    func testGridLines() {
        let gridLines = { self.presenter.gridLines(count: $0, cellSize: 10, boardSize: 40) }
        
        scope {
            let count = 6
            
            let lines = gridLines(count)
            XCTAssertEqual((count - 1) * 2, lines.count)
        }
        
        scope {
            let lines = gridLines(3)
            
            let reference: [Line] = [
                .horizontal(x: 10, y1: 10, y2: 30),
                .horizontal(x: 20, y1: 10, y2: 30),
                .vertical(x1: 10, x2: 30, y: 10),
                .vertical(x1: 10, x2: 30, y: 20)
            ]
            
            lines.forEach(
                reference.contains • { XCTAssertTrue($0) }
            )
        }
    }
    
    func testStones() {
        let board: Board & BoardState = GameData()
        
        let cellSize: CGFloat = 10
        let radius: CGFloat = 10
        
        let whiteLocations = [(0, 0), (3, 10)]
        let blackLocations = [(4, 5), (1, 9)]
        
        let locations: [(Int, Int, Player)] = [(.white, whiteLocations), (.black, blackLocations)]
            .flatMap { player, locations in
                locations.map { $0 + player }
            }
        
        locations.forEach(board.place • void)
        
        let stones = self.presenter.stones(cellSize: cellSize, radius: radius, board: board)
        
        let isEmptyPlayerStone: (Circle, Player) -> Bool = { _, player in
            player == .empty
        }
        
        let playerStones = stones.filter(isEmptyPlayerStone • (!))
        
        XCTAssertEqual(playerStones.count, locations.count)
        XCTAssertEqual(stones.filter(isEmptyPlayerStone).count, board.width * board.height - locations.count)

        let position = { CGFloat($0 + 1) * cellSize }
        
        locations
            .map(
                { ((position($0), position($1)), $2) }
                • { (Circle(center: $0 |> CGPoint.init, radius: radius), $1) }
                • { circle, player in
                    playerStones.contains { player == $0.player && circle == $0.circle }
                }
            )
            .forEach { XCTAssertTrue($0) }
    }
}

