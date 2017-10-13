class BoardFactoryImpl : BoardFactory {
    func makeBoard() -> Board & BoardState {
        return GameData()
    }
}

class GameData: Board, BoardState {
    
    // MARK: -
    // MARK: Subtypes
    
    fileprivate struct Dimensions {
        static let width = 19
        static let height = 19
    }
    
    // MARK: -
    // MARK: Properties
    
    var placedStones = [Int: Player]()
    var player = Player.white
    
    var width: Int {
        return Dimensions.width
    }
    
    var height: Int {
        return Dimensions.height
    }
    
    var stonesPlacedCount: Int {
        return self.placedStones.count
    }
    
    // MARK: -
    // MARK: Public
    
    func takeTurn(_ column: Int, _ row: Int) -> BoardError? {
        let error = self.place(column, row, player)
        self.player = self.other(player)
        
        return error
    }

    func other(_ player: Player) -> Player {
        return player == .white ? .black : .white
    }
    
    func whoseTurn() -> Player {
        return self.player
    }
    
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError? {
        return self.makeLocation(column, row)
            .flatMapValue {
                self.placedStones[$0] != nil ? liftError(.spaceOccupied) : liftValue($0)
            }
            .mapValue(
                sideEffect { self.placedStones[$0] = player }
            )
            .error
    }
    
    func makeLocation(_ column: Int, _ row: Int) -> Result<Int, BoardError>  {
        let width = self.width
        let isBadLocation = [(row, self.height), (column, width)]
            .map(
                { 0..<$1 ~= $0 } • (!)
            )
            .join(.or)
        
        return isBadLocation
            ? liftError(.badLocation)
            : liftValue(column * width + row)
    }
    
    func get(_ column: Int, _ row: Int) -> Result<Player, BoardError> {
        return self.makeLocation(column,row).mapValue {
            self.placedStones[$0] ?? .empty
        }
    }
}
