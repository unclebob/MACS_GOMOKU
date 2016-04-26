import XCTest
@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    func testEmptyBoard_isNotWin() {
        let board = Board()
        let rules = GomokuRules()
        rules.isWin(board)
        
    }
    
}
