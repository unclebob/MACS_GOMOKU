class GamePresenter {
    var playerTurnNames = [Player.White: "White's Turn", Player.Black: "Black's Turn", Player.Empty: "TILT"]
    
    func getPlayerStatus(player: Player) -> String {
        return playerTurnNames[player]!
    }
}
