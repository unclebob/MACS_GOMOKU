class GomokuRules {
    
    // MARK: -
    // MARK: Subtypes
    
    fileprivate struct Rules {
        static let winLength = 5
    }
    
    // MARK: -
    // MARK: Properties
    
    private let winLength = Rules.winLength
    
    // MARK: -
    // MARK: Public
    
    func isWin(_ board: BoardState,_ player: Player) -> Bool {
        return [self.isRowWin, self.isColWin]
            .apply((board, player))
            .join(.or)
    }
    
    // MARK: -
    // MARK: Private
    
    private func isRowWin(_ board: BoardState, _ player: Player) -> Bool {
        return self.isConsecutive(player, board.height, board.width) {
            board.get($1, $0)
        }
    }
    
    private func isColWin(_ board: BoardState, _ player: Player) -> Bool {
        return self.isConsecutive(player, board.width, board.height) {
            board.get($0, $1)
        }
    }
    
    private func isConsecutive(
        _ player: Player,
        _ iMax: Int,
        _ jMax: Int,
        getStone: (Int, Int) -> Result<Player, BoardError>
    )
        -> Bool
    {
        return intersperse(0..<iMax, 0..<jMax)
            .flatMap(getStone)
            .map { $0.value == player }
            .split { !$0 }
            .map { $0.count >= self.winLength }
            .filter { $0 }
            .count
            > 0
    }
}
