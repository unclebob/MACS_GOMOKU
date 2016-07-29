
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    var boardData: BoardData!
    
    override func setUp() {
        super.setUp()
        boardData = BoardData()
        board = boardData
    }
    
    func testNewBoardHasNoStones() {
        let stones = boardData.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
 
    func testCanAddStonesInBounds() {
        board.place(1,1, Player.White)
        
        XCTAssertEqual(1, boardData.stonesPlaced())
        XCTAssertEqual(Player.White, board.get(1,1).0)
        
        board.place(board.getWidth()-1,board.getHeight()-1,Player.Black)
        
        XCTAssertEqual(2, boardData.stonesPlaced())
        XCTAssertEqual(Player.Black, board.get(board.getWidth()-1,board.getHeight()-1).0 )
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
        XCTAssertEqual(board.place(board.getWidth(), board.getHeight(), Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(0, -1, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(0, board.getHeight(), Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(-1, 0, Player.White), BoardError.BadLocation)
        XCTAssertEqual(board.place(board.getWidth(), 0, Player.White), BoardError.BadLocation)
        
        XCTAssertEqual(0, boardData.stonesPlaced())
    }
}
