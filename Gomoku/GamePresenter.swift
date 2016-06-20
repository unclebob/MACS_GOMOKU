class GamePresenter {
    var playerTurnNames = [Player.White: "White's Turn", Player.Black: "Black's Turn", Player.Empty: "TILT"]
    var winStatusStrings = [Player.White: "White Wins!", Player.Black: "Black Wins!", Player.Empty: "TILT"]
    
    func getPlayerStatus(player: Player) -> String {
        return playerTurnNames[player]!
    }
    
    func getWinStatus(player: Player) -> String {
        return winStatusStrings[player]!
    }
}
