class GamePresenter {
    
    // MARK: -
    // MARK: Subtypes
    
    enum Strings: String {
        case tilt = "TILT"
        
        enum Turn: String {
            case white = "White's Turn"
            case black = "Black's Turn"
        }
        
        enum Win: String {
            case white = "White Wins!"
            case black = "Black Wins!"
        }
    }
    
    // MARK: -
    // MARK: Properties
    
    let playerTurnNames: [Player: Strings.Turn] = [.white: .white, .black: .black]
    let winStatusStrings: [Player: Strings.Win] = [.white: .white, .black: .black]
    
    // MARK: -
    // MARK: Public
    
    func getPlayerStatus(_ player: Player) -> String {
        return self.playerTurnNames[player] |> self.string
    }
    
    func getWinStatus(_ player: Player) -> String {
        return self.winStatusStrings[player] |> self.string
    }
    
    // MARK: -
    // MARK: Private
    
    private func string<Value: RawRepresentable>(for value: Value?) -> String
        where Value.RawValue == String
    {
        return value?.rawValue ?? Strings.tilt.rawValue
    }
}
