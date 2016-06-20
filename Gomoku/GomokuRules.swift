class GomokuRules {
    
    func isWin(board: Board) -> Bool {
        let row = 0
        var playerPiecesInARow = 0
        
        for col in 0..<board.WIDTH {
            let (playerPiece, _) = board.get(col, row)

            if playerPiece == Player.White {
                playerPiecesInARow += 1
            }
        }
        
        return playerPiecesInARow > 4
    }
    

}