
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
 
    func testCanAddStonesInBounds() throws {
        try board.place(Intersection(1,1), player: Player.White)
        XCTAssertEqual(1, board.stonesPlaced())
        
        var placedStone = try board.get(Intersection(1,1))
        XCTAssertEqual(Player.White, placedStone)
        
        try board.place(Intersection(board.WIDTH-1,board.HEIGHT-1), player: Player.Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        
        placedStone = try board.get(Intersection(board.WIDTH-1,board.HEIGHT-1))
        XCTAssertEqual(Player.Black, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        let emptyIntersection = Intersection(0,1)
        XCTAssertEqual(Player.Empty, try board.get(emptyIntersection))
        try board.place(emptyIntersection, player: Player.White)
        XCTAssertEqual(Player.White, try board.get(emptyIntersection))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(Intersection(0,0), player: Player.White)
        
        XCTAssertThrowsError(try board.place(0, column: 0, player: Player.Black))
        XCTAssertThrowsError(try board.place(0, column: 0, player: Player.Black))
        XCTAssertThrowsError(try board.place(0, column: 0, player: Player.White))
        // "against stupidity, the gods themselves, contend in vain" -- Schiller.
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(-1, column: -1, player: Player.White))
        XCTAssertThrowsError(try board.place(board.WIDTH, column: board.HEIGHT, player: Player.White))
        XCTAssertThrowsError(try board.place(0, column: -1, player: Player.White))
        XCTAssertThrowsError(try board.place(0, column: board.HEIGHT, player: Player.White))
        XCTAssertThrowsError(try board.place(-1, column: 0, player: Player.White))
        XCTAssertThrowsError(try board.place(board.WIDTH, column: 0, player: Player.White))
        
        XCTAssertEqual(0, board.stonesPlaced())
    }
}
