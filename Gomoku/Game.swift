protocol BoardFactory {
    func makeBoard() -> Board & BoardState
}

class Game {
    let board: Board & BoardState
    let rules: GomokuRules
    static var boardFactory : BoardFactory!

    init() {
        self.board = Game.boardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    @discardableResult
    func takeTurn(_ col: Int, _ row: Int) -> BoardError? {
       return board.takeTurn(col, row)
    }
    
    func whoseTurn() -> Player {
        return board.whoseTurn()
    }
    
    func getBoard() -> Board & BoardState {
        return board
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
