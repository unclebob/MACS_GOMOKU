protocol BoardState {
    var width: Int { get }
    var height: Int { get }
    
    func get(_ column: Int, _ row: Int) -> Result<Player, BoardError>
}
