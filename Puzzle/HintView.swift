//
//  HintView.swift
//  Puzzle
//
//  Created by marky RE on 5/29/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class HintView: UIView {
    @IBOutlet weak var close:UIButton!
    @IBOutlet weak var hintTextView:UITextView!
    override func awakeFromNib() {
        hintTextView.isScrollEnabled = false
        hintTextView.isEditable = false
        close.tintColor = UIColor.black
    }
}
