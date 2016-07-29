import XCTest

@testable import Gomoku

class GameTest: XCTestCase {
    func testWhiteStartsNewGame() {
        let game = Game()
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterATurn_isOtherPlayersTurn() {
        let game = Game()
        
        game.takeTurn(0,0)
        
        XCTAssertEqual(Player.White, game.getBoard().get(0,0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
        
        game.takeTurn(1,0)
        
        XCTAssertEqual(Player.Black, game.getBoard().get(1,0).0)
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
}
