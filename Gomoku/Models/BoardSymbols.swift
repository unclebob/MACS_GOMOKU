enum Player {
    case white
    case black
    case empty
}

enum BoardError: Error {
    case spaceOccupied
    case badLocation
}
