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
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.moveToPoint(CGPointMake(xPos, cellSize))
            path.addLineToPoint(CGPointMake(xPos, outerBoxSize - cellSize))
        }
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.moveToPoint(CGPointMake(cellSize, yPos))
            path.addLineToPoint(CGPointMake(outerBoxSize - cellSize, yPos))
        }
        
        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                let stone = try! board.get(Intersection(col, row))
                if stone != Player.Empty {
                    if stone == Player.White {
                        UIColor.whiteColor().set()
                    }
                    else {
                        UIColor.blackColor().set()
                    }
                    
                    let center = CGPoint(x: CGFloat(col + 1) * cellSize, y: CGFloat(row + 1) * cellSize)
                    let radius = cellSize / 3.0
                    
                    path.moveToPoint(center)
                    path.addArcWithCenter(center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
                }
            }
        }
        
        path.lineWidth = 1
        path.stroke()
        
        CGContextAddPath(context, path.CGPath)
        UIGraphicsEndImageContext()
    }
}
