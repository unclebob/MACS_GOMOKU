protocol BoardFactory {
    func makeBoard() -> Board
}

class Game {
    let board: Board
    let rules: GomokuRules
    var player = Player.white
    static var boardFactory : BoardFactory!

    init() {
        self.board = Game.boardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ col: Int, _ row: Int) {
        board.place(col, row, whoseTurn())
        player = other(player)
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func other(_ player: Player) -> Player {
        return player == Player.white ? Player.black : Player.white
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
