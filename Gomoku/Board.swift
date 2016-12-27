protocol Board {
    func takeTurn(_ column: Int, _ row: Int) -> BoardError?
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError?
    func get(_ column: Int, _ row: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
    func whoseTurn() -> Player
}

