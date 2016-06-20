
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
 
    func testCanAddStonesInBounds() {
        board.place(Intersection(1,1), player: Player.White)
        
        XCTAssertEqual(1, board.stonesPlaced())
        XCTAssertEqual(Player.White, board.get(Intersection(1,1)).0)
        
        board.place(Intersection(board.WIDTH-1,board.HEIGHT-1), player: Player.Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        XCTAssertEqual(Player.Black, board.get(Intersection(board.WIDTH-1,board.HEIGHT-1)).0 )
    }
    
    func testKnowsAboutEmptyIntersections() {
        let emptyIntersection = Intersection(0,1)
        XCTAssertEqual(Player.Empty,  board.get(emptyIntersection).0)
        board.place(emptyIntersection, player: Player.White)
        XCTAssertEqual(Player.White,  board.get(emptyIntersection).0)
    }
    
    func testCannotAddToOccupiedIntersection() {
        board.place(Intersection(0,0), player: Player.White)
        
        XCTAssertEqual(board.place(0, column: 0, player: Player.Black), BoardError.SpaceOccupied)
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
