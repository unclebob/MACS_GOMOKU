import XCTest

@testable import Gomoku

class GameTest: XCTestCase {
    func testWhiteStartsNewGame() {
        let board = BoardData()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterATurn_isOtherPlayersTurn() {
        let board = BoardData()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        game.takeTurn(0,0)
        
        XCTAssertEqual(Player.White, board.get(0,0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
        
        game.takeTurn(1,0)
        
        XCTAssertEqual(Player.Black, board.get(1,0).0)
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
}
