import XCTest
@testable import Gomoku

class GamePresenterTest: XCTestCase {
    func testFormatOfPlayerStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White's Turn", presenter.getPlayerStatus(Player.White))
        XCTAssertEqual("Black's Turn", presenter.getPlayerStatus(Player.Black))
    }
}
