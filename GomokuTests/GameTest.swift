import XCTest

@testable import Gomoku

class GameTest: XCTestCase {
    override func setUp() {
        Game.boardFactory = BoardFactoryImpl()
        super.setUp()
    }
    
    func testWhiteStartsNewGame() {
        let game = Game()
        XCTAssertEqual(Player.white, game.whoseTurn())
    }
    
    func testAfterATurn_isOtherPlayersTurn() {
        let game = Game()
        
        game.takeTurn(0,0)
        
        XCTAssertEqual(Player.white, game.getBoard().get(0,0).0)
        XCTAssertEqual(Player.black, game.whoseTurn())
        
        game.takeTurn(1,0)
        
        XCTAssertEqual(Player.black, game.getBoard().get(1,0).0)
        XCTAssertEqual(Player.white, game.whoseTurn())
    }
    
}
