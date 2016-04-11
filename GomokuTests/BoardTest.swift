
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
 
    func testCanAddOneWhiteStone() throws {
        let row = 1
        let col = 1
        let player = Player.White
        try board.place(row, column: col, player: player)
        
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = try board.get(row, column:col)
        XCTAssertEqual(Player.White, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(0,column: 1))
        try board.place(0, column: 1, player: Player.White)
        XCTAssertEqual(Player.White, try board.get(0,column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(0, column: 0, player: Player.White)
        
        XCTAssertThrowsError(try board.place(0, column: 0, player: Player.Black))
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(42, column: 42, player: Player.White))
    }
}
