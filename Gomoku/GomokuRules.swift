class GomokuRules {
    
    func isWin(board: Board) throws -> Bool {
        let row = 0
        var playerPiecesInARow = 0
        
        for col in 0..<board.WIDTH {
            let playerPiece = try board.get(Intersection(col, row))
            if playerPiece == Player.White {
                playerPiecesInARow += 1
            }
        }
        
        return playerPiecesInARow > 4
    }
}