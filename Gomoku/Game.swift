protocol BoardFactory {
    func makeBoard() -> Board
}

class Game {
    let board: Board
    let rules: GomokuRules
    static var boardFactory : BoardFactory!

    init() {
        self.board = Game.boardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ col: Int, _ row: Int) -> BoardError? {
       return board.takeTurn(col, row)
    }
    
    func whoseTurn() -> Player {
        return board.whoseTurn()
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
