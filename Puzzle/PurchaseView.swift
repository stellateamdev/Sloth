//
//  PurchaseView.swift
//  Puzzle
//
//  Created by marky RE on 6/8/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class PurchaseView: UIView {
    @IBOutlet weak var message:UILabel!
    @IBOutlet weak var buy:UIButton!
    @IBOutlet weak var restore:UIButton!
    override func awakeFromNib() {
        message.text = "Buy to unlock all puzzles"
        
        buy.setTitle("Buy for 9 Baht", for: .normal)
        buy.setTitleColor(UIColor.white, for: .normal)
        buy.backgroundColor = UIColor.black
        buy.layer.cornerRadius = 5.0
        
        restore.setTitle("Restore Purchase", for: .normal)
        restore.setTitleColor(UIColor.white, for: .normal)
        restore.backgroundColor = UIColor.black
        restore.layer.cornerRadius = 5.0
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
