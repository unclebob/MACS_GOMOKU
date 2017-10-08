import XCTest
@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    var board : Board!
    var rules : GomokuRules!
    var boardState : BoardState!
    
    override func setUp() {
        Game.boardFactory = BoardFactoryImpl()
        board = Game.boardFactory.makeBoard()
        boardState = board as! BoardState
        rules = GomokuRules()
        super.setUp()
    }
    
    func testEmptyBoard_isNotAWin() {
        XCTAssertFalse(rules.isWin(boardState, Player.white))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() {
        _ = board.place(1,1, Player.white)
        XCTAssertFalse(rules.isWin(boardState, Player.white))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() {
        for col in 0..<5 {
            _ = board.place(col,0,Player.black)
        }
        
        XCTAssertTrue(rules.isWin(boardState, Player.black))
    }
    
    func testFiveConsecutiveStonesForOtherPlayer_isALose() {
        for col in 0..<5 {
            _ = board.place(col,0,Player.black)
        }
        
        XCTAssertFalse(rules.isWin(boardState, Player.white))
    }
    
    func testFourInARowInTheFirstRow_isALose() {
        for col in 0..<4 {
            _ = board.place(col,0,Player.white)
        }
        
        XCTAssertFalse(rules.isWin(boardState, Player.white))
    }
    
    func testSixInARowInTheFirstRow_isAWin() {
        for col in 0..<6 {
            _ = board.place(col,0, Player.white)
        }
        
        XCTAssertTrue(rules.isWin(boardState, Player.white))
    }
    
    func testFiveConsecutiveInAnyRow_isAWin() {
        for row in 0..<board.getHeight() {
            board = Game.boardFactory.makeBoard()
            boardState = board as! BoardState
            for col in 0..<5 {
                _ = board.place(col,row, Player.black)
            }
            XCTAssertTrue(rules.isWin(boardState, Player.black))
        }
    }
    
    func testFiveNonConsecutiveStonesInRow_isALose() {
        _ = board.place(1,0, Player.white)
        _ = board.place(3,0, Player.white)
        _ = board.place(5,0, Player.white)
        _ = board.place(7,0, Player.white)
        _ = board.place(9,0, Player.white)
        XCTAssertFalse(rules.isWin(boardState, Player.white))
    }
    
    func testFiveConsecutiveStonesInColumn_isAWin() {
        for row in 0..<5 {
            _ = board.place(0, row, Player.black)
        }
        XCTAssertTrue(rules.isWin(boardState, Player.black))
    }
}
