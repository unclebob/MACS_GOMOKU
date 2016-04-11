
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    func testNewBoardHasNoStones() {
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
 
    func testCanAddOneWhiteStone() {
        let row = 1
        let col = 1
        let player = Player.White
        board.add(row, column: col, player: player)
        
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = board.get(row, column:col)
        XCTAssertEqual(Player.White, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(Player.Empty, board.get(0,column: 1))
    }
    
}
