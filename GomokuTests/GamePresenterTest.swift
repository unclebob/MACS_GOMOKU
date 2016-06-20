import XCTest
@testable import Gomoku

class GamePresenterTest: XCTestCase {
    func testFormatOfPlayerStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White's Turn", presenter.getPlayerStatus(Player.White))
        XCTAssertEqual("Black's Turn", presenter.getPlayerStatus(Player.Black))
    }
    
    func testFormatOfPlayerWinStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White Wins!", presenter.getWinStatus(Player.White))
    }
}
