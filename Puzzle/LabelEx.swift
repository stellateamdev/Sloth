//
//  LabelEx.swift
//  Puzzle
//
//  Created by marky RE on 6/16/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func createOutLine(name:String) -> NSMutableAttributedString {
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.white,
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeWidthAttributeName : -4.0,
            NSFontAttributeName : UIFont.boldSystemFont(ofSize: 30)
            ] as [String : Any]
        return NSMutableAttributedString(string: name, attributes: strokeTextAttributes)

    }
}
