//
//  TextViewEx.swift
//  Puzzle
//
//  Created by marky RE on 7/23/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func createOutLine(name:String) -> NSMutableAttributedString {
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.played(),
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeWidthAttributeName : -2.5,
            NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30)
            ] as [String : Any]
        return NSMutableAttributedString(string: name, attributes: strokeTextAttributes)
        
    }
}
