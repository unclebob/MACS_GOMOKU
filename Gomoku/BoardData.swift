class BoardFactoryImpl : BoardFactory {
    func makeBoard() -> Board {
        return BoardData()
    }
}

class BoardData: Board, BoardState {
    fileprivate let WIDTH=19
    fileprivate let HEIGHT=19
    
    var placedStones = [Int: Player]()
    
    func getWidth() -> Int {
        return WIDTH
    }
    func getHeight() -> Int {
        return HEIGHT
    }
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }

    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError? {
        let (loc, error) = makeLocation(column, row)
        if (error != nil) {
            return error
        }
        if (placedStones[loc] != nil) {
            return .spaceOccupied
        }
        placedStones[loc] = player
        return nil
    }
    func makeLocation(_ column: Int, _ row: Int) -> (Int, BoardError?)  {
        var error : BoardError?
        if row < 0 || row >= HEIGHT || column < 0 || column >= WIDTH {
            error = .badLocation
        }
        return (column * WIDTH + row, error)
    }
    
    func get(_ column: Int, _ row: Int) -> (Player?, BoardError?) {
        let (loc, error) = makeLocation(column,row)
        if (error != nil) {
            return (nil, error)
        }
        
        if let stone = placedStones[loc] {
            return (stone, nil)
        }
        else {
            return (Player.empty, nil)
        }
    }
}
