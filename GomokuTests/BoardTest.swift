
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    func testCanCreateBoard() {
        var board = Board()
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
    
}
