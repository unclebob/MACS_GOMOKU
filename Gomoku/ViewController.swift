import UIKit

class ViewController: UIViewController {
    var statusLabel: UILabel!
    var game: Game!
    var presenter: GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        game = Game()
        presenter = GamePresenter()
        
        let gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.width), board: game.getBoard())
        self.view.addSubview(gridView)
        
        gridView.tapResponder = { (col, row) in
            self.respondToTap(col, row: row)
        }
        
        let labelWidth: CGFloat = 100.0
        statusLabel = UILabel(frame: CGRect(x: (view.frame.width - labelWidth) / 2.0, y: 100,width: labelWidth, height: 25))
        self.view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        statusLabel.textColor = UIColor.white
        statusLabel.textAlignment = NSTextAlignment.center
    }

    
    func respondToTap(_ col: Int, row: Int) {
        game.takeTurn(col, row)
        if game.getRules().isWin(game.getBoard(), game.whoseTurn()) {
            statusLabel.text = presenter.getWinStatus(game.whoseTurn())
        }
        else {
            statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        }
    }
}

