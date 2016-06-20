//
//  ViewController.swift
//  Gomoku
//
//  Created by Robert C Martin on 4/11/16.
//  Copyright © 2016 Cleancoders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var statusLabel: UILabel!
    var board: Board!
    var rules: GomokuRules!
    var game: Game!
    var presenter: GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        
        board = Board()
        rules = GomokuRules()
        game = Game(board: board, rules: rules)
        presenter = GamePresenter()
        
        let gridView = GridView(frame: CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.width), game: game)
        self.view.addSubview(gridView)
        gridView.tapResponder = () -> (col)
        
        let labelWidth: CGFloat = 100.0
        statusLabel = UILabel(frame: CGRectMake((view.frame.width - labelWidth) / 2.0, 100,labelWidth, 25))
        self.view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(game.whoseTurn())
        statusLabel.textColor = UIColor.whiteColor()
        statusLabel.textAlignment = NSTextAlignment.Center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

