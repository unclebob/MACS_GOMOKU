protocol Board {
    var width: Int { get }
    var height: Int { get }
    
    @discardableResult
    func takeTurn(_ column: Int, _ row: Int) -> BoardError?
    
    @discardableResult
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError?
    func get(_ column: Int, _ row: Int) -> Result<Player, BoardError>
    func whoseTurn() -> Player
}

