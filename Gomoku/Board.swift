
enum Player {
    case White
    case Black
    case Empty
}

enum BoardError {
    case SpaceOccupied, BadLocation
}

class Board {
    let WIDTH=19
    let HEIGHT=19
    
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }

    func place(column: Int, _ row: Int, _ player: Player) -> BoardError? {
        let (loc, error) = makeLocation(column, row)
        if (error != nil) {
            return error
        }
        if (placedStones[loc] != nil) {
            return .SpaceOccupied
        }
        placedStones[loc] = player
        return nil
    }
    func makeLocation(column: Int, _ row: Int) -> (Int, BoardError?)  {
        var error : BoardError?
        if row < 0 || row >= HEIGHT || column < 0 || column >= WIDTH {
            error = .BadLocation
        }
        return (column * WIDTH + row, error)
    }
    
    func get(column: Int, _ row: Int) -> (Player?, BoardError?) {
        let (loc, error) = makeLocation(column,row)
        if (error != nil) {
            return (nil, error)
        }
        
        if let stone = placedStones[loc] {
            return (stone, nil)
        }
        else {
            return (Player.Empty, nil)
        }
    }
}