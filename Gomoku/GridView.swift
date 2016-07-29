import UIKit


typealias TapResponder = (col: Int, row: Int) -> ()
class GridView: UIView {
    let game: Game
    let board: BoardData
    let boardSize: CGFloat
    let cellCount: Int
    let cellSize: CGFloat
    var tapper: UITapGestureRecognizer!
    var tapResponder: TapResponder?
    
    init(frame: CGRect, game: Game) {
        self.game = game
        self.board = game.getBoard()
        self.boardSize = min(frame.size.width, frame.size.height)
        self.cellCount = board.getWidth() + 1
        self.cellSize = boardSize / CGFloat(cellCount)
        super.init(frame: frame)
        self.tapper = UITapGestureRecognizer(target: self, action: #selector(GridView.tapped(_:)))
        self.addGestureRecognizer(self.tapper)
        self.backgroundColor = UIColor(colorLiteralRed: 255/255.0, green: 226/255.0, blue: 154/255.0, alpha: 1)
    }
    
    func setResponder(responder: TapResponder) {
        self.tapResponder = responder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped(tapper: UITapGestureRecognizer) {
        let locationOfTap = tapper.locationOfTouch(0, inView: self)
        
        let tappedColumn = Int((locationOfTap.x - cellSize) / cellSize + 0.5)
        let tappedRow = Int((locationOfTap.y - cellSize) / cellSize + 0.5)
        self.tapResponder?(col: tappedColumn, row: tappedRow)
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.moveToPoint(CGPointMake(xPos, cellSize))
            path.addLineToPoint(CGPointMake(xPos, boardSize - cellSize))
        }
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.moveToPoint(CGPointMake(cellSize, yPos))
            path.addLineToPoint(CGPointMake(boardSize - cellSize, yPos))
        }
        path.lineWidth = 1
        path.stroke()
        
        for col in 0..<board.getWidth() {
            for row in 0..<board.getHeight() {
                let (stone, _) = board.get(col, row)
                if stone != Player.Empty {
                    let stonePath = UIBezierPath()
                    if stone == Player.White {
                        UIColor.whiteColor().setFill()
                    }
                    else {
                        UIColor.blackColor().setFill()
                    }
                    
                    let center = CGPoint(x: CGFloat(col + 1) * cellSize, y: CGFloat(row + 1) * cellSize)
                    let stoneRadius = cellSize / 2.5
                    
                    stonePath.moveToPoint(center)
                    stonePath.addArcWithCenter(center, radius: stoneRadius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
                    stonePath.fill()
                }
            }
        }
        

    }
}
