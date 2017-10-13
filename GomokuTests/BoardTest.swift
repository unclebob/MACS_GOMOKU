
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!
    var boardData: GameData!
    
    override func setUp() {
        super.setUp()
        boardData = GameData()
        board = boardData
    }
    
    func testNewBoardHasNoStones() {
        let stones = boardData.stonesPlacedCount
        XCTAssertEqual(0, stones)
    }
 
    func testCanAddStonesInBounds() {
        board.place(1,1, Player.white)
        
        XCTAssertEqual(1, boardData.stonesPlacedCount)
        XCTAssertEqual(Player.white, board.get(1,1).value)
        
        board.place(board.width-1,board.height-1,Player.black)
        
        XCTAssertEqual(2, boardData.stonesPlacedCount)
        XCTAssertEqual(Player.black, board.get(board.width-1,board.height-1).value )
    }
    
    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(Player.empty,  board.get(0,1).value)
        board.place(0,1,Player.white)
        XCTAssertEqual(Player.white,  board.get(0,1).value)
    }
    
    func testCannotAddToOccupiedIntersection() {
        board.place(0,0, Player.white)
        
        XCTAssertEqual(board.place(0, 0, Player.black), BoardError.spaceOccupied)
        XCTAssertEqual(board.place(0, 0, Player.white), BoardError.spaceOccupied)
    }
    
    func testCannotPlaceStonesOutsideBounds() {
        XCTAssertEqual(board.place(-1, -1, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(board.width, board.height, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(0, -1, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(0, board.height, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(-1, 0, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(board.width, 0, Player.white), BoardError.badLocation)
        
        XCTAssertEqual(0, boardData.stonesPlacedCount)
    }
}
