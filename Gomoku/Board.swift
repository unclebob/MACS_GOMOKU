protocol Board {
    func place(column: Int, _ row: Int, _ player: Player) -> BoardError?
    func get(column: Int, _ row: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
}

