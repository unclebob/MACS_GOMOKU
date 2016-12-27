protocol Board {
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError?
    func get(_ column: Int, _ row: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
}

