class GomokuRules {
    
    func isWin(board: Board,_ player: Player) -> Bool {
        if isRowWin(board, player) ||
            isColWin(board, player) {
            return true
        }
        else {
            return false
        }
    }
    
    func isRowWin(board: Board, _ player: Player) -> Bool {
        var consecutiveStones = 0
        
        for row in 0..<board.HEIGHT {
            for col in 0..<board.WIDTH {
                let (playerPiece, _) = board.get(col, row)
                
                if playerPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                }
                else {
                    consecutiveStones = 0;
                }
            }
        }
        
        return false
    }
    
    func isColWin(board: Board, _ player: Player) -> Bool {
        var consecutiveStones = 0
        
        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                let (playerPiece, _) = board.get(col, row)
                
                if playerPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                }
                else {
                    consecutiveStones = 0;
                }
            }
        }
        
        return false
    }

}