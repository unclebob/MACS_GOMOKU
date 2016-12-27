class GomokuRules {
    let winLength = 5
    func isWin(_ board: BoardState,_ player: Player) -> Bool {
        if isRowWin(board, player) ||
            isColWin(board, player) {
            return true
        }
        else {
            return false
        }
    }
    
    func isRowWin(_ board: BoardState, _ player: Player) -> Bool {
        return isConsecutive(board, player, board.getHeight(), board.getWidth()) { (i, j) -> Player in
            return board.get(j,i).0!
        }
    }
    
    func isColWin(_ board: BoardState, _ player: Player) -> Bool {
        return isConsecutive(board, player, board.getWidth(), board.getHeight()) { (i, j) -> Player in
            return board.get(i,j).0!
        }
    }
    
    func isConsecutive(_ board: BoardState,_ player: Player,_ iMax:Int,_ jMax:Int, getStone: (_ i: Int, _ j:Int) -> Player) -> Bool {
        var consecutiveStones = 0
        
        for i in 0..<iMax {
            for j in 0..<jMax {
                let playerPiece = getStone(i,j)
                consecutiveStones = calculateConsecutiveStones(consecutiveStones, playerPiece, player)
                if consecutiveStones >= winLength {
                    return true
                }
            }
        }
        
        return false
    }
    
    func calculateConsecutiveStones(_ consecutiveStones: Int, _ playerPiece: Player, _ player: Player) -> Int{
        return playerPiece == player ? consecutiveStones + 1 : 0
    }

}
