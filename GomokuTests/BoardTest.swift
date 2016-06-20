
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
        board.place(1,1, Player.White)
        
        XCTAssertEqual(1, board.stonesPlaced())
        XCTAssertEqual(Player.White, board.get(1,1).0)
        
        board.place(board.WIDTH-1,board.HEIGHT-1,Player.Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        XCTAssertEqual(Player.Black, board.get(board.WIDTH-1,board.HEIGHT-1).0 )
    }
    
    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(Player.Empty,  board.get(0,1).0)
        board.place(0,1,Player.White)
        XCTAssertEqual(Player.White,  board.get(0,1).0)
    }
    
    func testCannotAddToOccupiedIntersection() {
        board.place(0,0, Player.White)
        
        XCTAssertEqual(board.place(0, 0, Player.Black), BoardError.SpaceOccupied)
        XCTAssertEqual(board.place(0, 0, Player.White), BoardError.SpaceOccupied)
    }
    
    func testCannotPlaceStonesOutsideBounds() {
        XCTAssertEqual(board.place(-1, -1, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(board.WIDTH, board.HEIGHT, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(0, -1, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(0, board.HEIGHT, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(-1, 0, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(board.WIDTH, 0, Player.White), BoardError.BadLocation)
        
        XCTAssertEqual(0, board.stonesPlaced())
    }
}
