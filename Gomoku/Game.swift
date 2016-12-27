protocol BoardFactory {
    func makeBoard() -> Board
}

class Game {
    let board: Board
    let gameData: GameData
    let rules: GomokuRules
    static var boardFactory : BoardFactory!

    init() {
        self.board = Game.boardFactory.makeBoard()
        self.gameData = GameData()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ col: Int, _ row: Int) -> BoardError? {
       return gameData.takeTurn(col, row)
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
