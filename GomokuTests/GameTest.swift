import XCTest

@testable import Gomoku

class GameTest: XCTestCase {
    func testWhiteStartsNewGame() {
        let board = Board()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterWhitesTurn_isBlacksTurn() {
        let board = Board()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        game.takeTurn(0,0)
        
        XCTAssertEqual(Player.White, board.get(0,0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
    }
    
}
