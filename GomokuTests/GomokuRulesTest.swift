import XCTest
@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    var board : Board!
    var rules : GomokuRules!
    
    override func setUp() {
        board = Board()
        rules = GomokuRules()
        super.setUp()
    }
    
    func testEmptyBoard_isNotAWin() {
        XCTAssertFalse(rules.isWin(board))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() {
        board.place(1,1, Player.White)
        XCTAssertFalse(rules.isWin(board))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() {
        for col in 0..<5 {
            board.place(col,0,Player.White)
        }
        
        XCTAssertTrue(rules.isWin(board))
    }
    
    func testFourInARowInTheFirstRow_isALose() {
        for col in 0..<4 {
            board.place(col,0,Player.White)
        }
        
        XCTAssertFalse(rules.isWin(board))
    }
    
    func testSixInARowInTheFirstRow_isAWin() {
        for col in 0..<6 {
            board.place(col,0, Player.White)
        }
        
        XCTAssertTrue(rules.isWin(board))
    }
//    
//    func testFiveInARowInAnyRow_isAWin() throws {
//        for row in 0..<board.HEIGHT {
//            board = Board()
//            for col in 0..<5 {
//                try board.place(Intersection(col,row), player:Player.White)
//            }
//            try XCTAssertTrue(rules.isWin(board))
//        }
//    }
    
}
