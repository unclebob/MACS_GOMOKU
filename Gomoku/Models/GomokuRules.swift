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
        return self.isConsecutive(board, player, board.height, board.width, transformIndex: reverse)
    }
    
    private func isColWin(_ board: BoardState, _ player: Player) -> Bool {
        return self.isConsecutive(board, player, board.width, board.height, transformIndex: identity)
    }
    
    private func isConsecutive(
        _ board: BoardState,
        _ player: Player,
        _ iMax: Int,
        _ jMax: Int,
        transformIndex: @escaping ((Int, Int)) -> (Int, Int)
    )
        -> Bool
    {
        return intersperse(0..<iMax, 0..<jMax)
            .map(
                transformIndex • board.get • { $0.value == player }
            )
            .split { !$0 }
            .map { $0.count >= self.winLength }
            .filter { $0 }
            .count
            > 0
    }
}
