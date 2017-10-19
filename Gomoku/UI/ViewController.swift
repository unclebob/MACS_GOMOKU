import UIKit

class ViewController: UIViewController {
    lazy var statusLabel: UILabel = self.makeStatusLabel()
    lazy var game = Game()
    lazy var presenter = GamePresenter()
    lazy var boardPresenter = BoardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        let gridView = GridView(
            frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.width),
            board: game.getBoard(),
            presenter: self.boardPresenter
        )
        
        self.view.addSubview(gridView)
        
        gridView.tapResponder = weakify(ViewController.respondToTap, object: self)
        
        self.view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        statusLabel.textColor = UIColor.white
        statusLabel.textAlignment = NSTextAlignment.center
    }

    
    func respondToTap(_ col: Int, row: Int) {
        let tappingPlayer = game.whoseTurn()
        game.takeTurn(col, row)
        if game.getRules().isWin(game.getBoard(), tappingPlayer) {
            statusLabel.text = presenter.getWinStatus(tappingPlayer)
        }
        else {
            statusLabel.text = presenter.getPlayerStatus(tappingPlayer)
        }
    }
    
    func makeStatusLabel() -> UILabel {
        let labelWidth: CGFloat = 100.0
        
        return UILabel(frame: CGRect(x: (view.frame.width - labelWidth) / 2.0, y: 100,width: labelWidth, height: 25))
    }
}

