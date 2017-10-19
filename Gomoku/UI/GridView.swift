import UIKit

fileprivate extension Selector {
    fileprivate static let tapped = #selector(GridView.tapped(_:))
}

class GridView: UIView {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias TapResponder = (_ col: Int, _ row: Int) -> ()
    
    // MARK: -
    // MARK: Properties
    
    let board: BoardState
    let presenter: BoardPresenter
    
    var boardSize: CGFloat {
        let frame = self.frame
        
        return min(frame.width, frame.height)
    }
    
    var cellCount: Int {
        return self.board.width + 1
    }
    
    var cellSize: CGFloat {
        return self.boardSize / CGFloat(cellCount)
    }
    
    lazy private(set) var tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: .tapped)
    var tapResponder: TapResponder?

    // MARK: -
    // MARK: Init and Deinit
    
    init(frame: CGRect, board: BoardState, presenter: BoardPresenter) {
        self.board = board
        self.presenter = presenter
        
        super.init(frame: frame)
        
        self.addGestureRecognizer(self.tapRecognizer)
        self.backgroundColor = UIColor(colorLiteralRed: 255/255.0, green: 226/255.0, blue: 154/255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Interface Handling
    
    func tapped(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(ofTouch: 0, in: self)
        let cellSize = self.cellSize
        
        let gridTapLocation = { Int(($0 - cellSize) / cellSize + 0.5) }
        
        let column = gridTapLocation(tapLocation.x)
        let row = gridTapLocation(tapLocation.y)
        
        self.tapResponder?(column, row)
        
        self.setNeedsDisplay()
    }
    
    // MARK: -
    // MARK: Private
    
    override func draw(_ rect: CGRect) {
        self.drawGrid()
        self.drawStones()
    }
    
    private func drawGrid() {
        let path = UIBezierPath()
        
        self.presenter
            .gridLines(count: self.cellCount,cellSize: self.cellSize, boardSize: self.boardSize)
            .forEach(path.add)
        
        path.lineWidth = 1
        path.stroke()
    }
    
    private func drawStones() {
        let cellSize = self.cellSize
        
        self.presenter
            .stones(cellSize: cellSize, radius: cellSize / 2.5, board: self.board)
            .filter { $0.player != .empty }
            .forEach {
                self.color(for: $1).setFill()
                
                UIBezierPath($0).fill()
            }
    }
    
    private func color(for player: Player) -> UIColor {
        switch player {
        case .white: return .white
        case .black: return .black
        case .empty: return .clear
        }
    }
}
