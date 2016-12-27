import XCTest
@testable import Gomoku

class GamePresenterTest: XCTestCase {
    func testFormatOfPlayerStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White's Turn", presenter.getPlayerStatus(Player.white))
        XCTAssertEqual("Black's Turn", presenter.getPlayerStatus(Player.black))
    }
    
    func testFormatOfPlayerWinStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White Wins!", presenter.getWinStatus(Player.white))
    }
}
