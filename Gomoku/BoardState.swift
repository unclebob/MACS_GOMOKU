protocol BoardState {
    func get(column: Int, _ row: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
}
