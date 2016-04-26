
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
        
        var placedStone = try board.get(1, column:1)
        XCTAssertEqual(Player.White, placedStone)
        
        try board.place(Intersection(board.WIDTH-1,board.HEIGHT-1), player: Player.Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        
        placedStone = try board.get(board.WIDTH-1, column:board.HEIGHT-1)
        XCTAssertEqual(Player.Black, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(0,column: 1))
        try board.place(Intersection(0,1), player: Player.White)
        XCTAssertEqual(Player.White, try board.get(0,column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(Intersection(0,0), player: Player.White)
        let badIntersection = Intersection(0,0)
        XCTAssertThrowsError(try board.place(badIntersection, player: Player.Black))
        XCTAssertThrowsError(try board.place(0, column: 0, player: Player.White))
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
