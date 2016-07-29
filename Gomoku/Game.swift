class Game {
    let board: Board
    let rules: GomokuRules
    var player = Player.White

    init() {
        self.board = BoardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    func takeTurn(col: Int, _ row: Int) {
        board.place(col, row, whoseTurn())
        player = other(player)
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func other(player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
