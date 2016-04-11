
enum Player {
    case White
    case Black
    case Empty
}

class Board {
    var stones = 0
    var placedStones = [Int: Player]()
    
    func stonesPlaced() -> Int {
        return stones
    }
    
    func add(row: Int, column: Int, player: Player) {
        stones += 1
    }
    
    func get(row: Int, column: Int) -> Player {
        return .White
    }
}