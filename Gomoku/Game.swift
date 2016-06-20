class Game {
    let board: Board
    var player = Player.White
    init(board: Board, rules: GomokuRules) {
        self.board = board
    }
    
    func takeTurn(col: Int, _ row: Int) {
        board.place(col, row, whoseTurn())
        player = player == Player.White ? Player.Black : Player.White
    }
    
    func whoseTurn() -> Player {
        return player
    }
}
