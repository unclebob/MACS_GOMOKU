import UIKit

class GridView: UIView {
    let board: Board
    
    
    init(frame: CGRect, board: Board) {
        self.board = board
        super.init(frame: frame)
        self.backgroundColor = UIColor(colorLiteralRed: 255/255.0, green: 226/255.0, blue: 154/255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let outerBoxSize = min(rect.size.width, rect.size.height)
        let cellCount = board.WIDTH + 1
        let cellSize = outerBoxSize / CGFloat(cellCount)
        
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        
        for i in 1...cellCount {
            let xPos = CGFloat(i) * cellSize
            path.moveToPoint(CGPointMake(i * cellSize, cellSize))
            path.addLineToPoint(CGPointMake(i * cellSize, outerBoxSize - cellSize))
        }
        
        
    }
}
