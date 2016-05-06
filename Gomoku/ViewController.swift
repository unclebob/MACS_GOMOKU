//
//  ViewController.swift
//  Gomoku
//
//  Created by Robert C Martin on 4/11/16.
//  Copyright © 2016 Cleancoders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        var board = Board()
        let gridView = GridView(frame: CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.width), board: board)
        self.view.addSubview(gridView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

