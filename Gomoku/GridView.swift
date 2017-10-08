import UIKit


typealias TapResponder = (_ col: Int, _ row: Int) -> ()
class GridView: UIView {
    let board: BoardState
    let boardSize: CGFloat
    let cellCount: Int
    let cellSize: CGFloat
    lazy var tapper: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(GridView.tapped(_:)))
    }()
    var tapResponder: TapResponder?
    
    init(frame: CGRect, board: BoardState) {
        self.board = board
        self.boardSize = min(frame.size.width, frame.size.height)
        self.cellCount = board.getWidth() + 1
        self.cellSize = boardSize / CGFloat(cellCount)
        super.init(frame: frame)
        self.addGestureRecognizer(self.tapper)
        self.backgroundColor = UIColor(red: 255/255.0, green: 226/255.0, blue: 154/255.0, alpha: 1)
    }
    
    func setResponder(_ responder: @escaping TapResponder) {
        self.tapResponder = responder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(_ tapper: UITapGestureRecognizer) {
        let locationOfTap = tapper.location(ofTouch: 0, in: self)
        
        let tappedColumn = Int((locationOfTap.x - cellSize) / cellSize + 0.5)
        let tappedRow = Int((locationOfTap.y - cellSize) / cellSize + 0.5)
        self.tapResponder?(tappedColumn, tappedRow)
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: xPos, y: cellSize))
            path.addLine(to: CGPoint(x: xPos, y: boardSize - cellSize))
        }
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: cellSize, y: yPos))
            path.addLine(to: CGPoint(x: boardSize - cellSize, y: yPos))
        }
        path.lineWidth = 1
        path.stroke()
        
        for col in 0..<board.getWidth() {
            for row in 0..<board.getHeight() {
                let (stone, _) = board.get(col, row)
                if stone != Player.empty {
                    let stonePath = UIBezierPath()
                    if stone == Player.white {
                        UIColor.white.setFill()
                    }
                    else {
                        UIColor.black.setFill()
                    }
                    
                    let center = CGPoint(x: CGFloat(col + 1) * cellSize, y: CGFloat(row + 1) * cellSize)
                    let stoneRadius = cellSize / 2.5
                    
                    stonePath.move(to: center)
                    stonePath.addArc(withCenter: center, radius: stoneRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
                    stonePath.fill()
                }
            }
        }
        

    }
}
