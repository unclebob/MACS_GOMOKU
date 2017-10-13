protocol BoardFactory {
    func makeBoard() -> Board & BoardState
}

class Game {
    
    // MARK: -
    // MARK: Static
    
    static var boardFactory : BoardFactory!
    
    // MARK: -
    // MARK: Properties
    
    let board: Board & BoardState
    let rules: GomokuRules
    
    // MARK: -
    // MARK: Init and Deinit

    init() {
        self.board = Game.boardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    // MARK: -
    // MARK: Public
    
    @discardableResult
    func takeTurn(_ col: Int, _ row: Int) -> BoardError? {
       return self.board.takeTurn(col, row)
    }
    
    func whoseTurn() -> Player {
        return self.board.whoseTurn()
    }
    
    func getBoard() -> Board & BoardState {
        return self.board
    }
    
    func getRules() -> GomokuRules {
        return self.rules
    }
}
