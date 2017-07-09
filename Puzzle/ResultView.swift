//
//  ResultView.swift
//  Puzzle
//
//  Created by marky RE on 6/1/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class ResultView: UIView {
    @IBOutlet weak var proceed:UIButton!
    @IBOutlet weak var resultText:UILabel!
    @IBOutlet weak var title:UILabel!
    override func awakeFromNib() {
        proceed.backgroundColor = UIColor.black
        proceed.layer.cornerRadius = 5.0
        
    }

}
