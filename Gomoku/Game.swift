class Game {
    let board: Board
    let rules: GomokuRules
    var player = Player.White
    init(board: Board, rules: GomokuRules) {
        self.board = board
        self.rules = rules
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
    
    func getBoard() -> Board {
        return board
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
