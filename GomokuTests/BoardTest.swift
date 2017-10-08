
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
        let stones = boardData.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
 
    func testCanAddStonesInBounds() {
        _ = board.place(1,1, Player.white)
        
        XCTAssertEqual(1, boardData.stonesPlaced())
        XCTAssertEqual(Player.white, board.get(1,1).0)
        
        _ = board.place(board.getWidth()-1,board.getHeight()-1,Player.black)
        
        XCTAssertEqual(2, boardData.stonesPlaced())
        XCTAssertEqual(Player.black, board.get(board.getWidth()-1,board.getHeight()-1).0 )
    }
    
    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(Player.empty,  board.get(0,1).0)
        _ = board.place(0,1,Player.white)
        XCTAssertEqual(Player.white,  board.get(0,1).0)
    }
    
    func testCannotAddToOccupiedIntersection() {
        _ = board.place(0,0, Player.white)
        
        XCTAssertEqual(board.place(0, 0, Player.black), BoardError.spaceOccupied)
        XCTAssertEqual(board.place(0, 0, Player.white), BoardError.spaceOccupied)
    }
    
    func testCannotPlaceStonesOutsideBounds() {
        XCTAssertEqual(board.place(-1, -1, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(board.getWidth(), board.getHeight(), Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(0, -1, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(0, board.getHeight(), Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(-1, 0, Player.white), BoardError.badLocation)
        XCTAssertEqual(board.place(board.getWidth(), 0, Player.white), BoardError.badLocation)
        
        XCTAssertEqual(0, boardData.stonesPlaced())
    }
}
