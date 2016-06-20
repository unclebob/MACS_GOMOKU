import XCTest
@testable import Gomoku

class GamePresenterTest: XCTestCase {
    func testFormatOfPlayerStatus() {
        let presenter = GamePresenter()
        let playerStatus = presenter.getPlayerStatus(Player.White)
        XCTAssertEqual("White's Turn", playerStatus)
    }
}
