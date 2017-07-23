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
    func createOutLine(name:String,size:Int,width:Double,color:UIColor) -> NSMutableAttributedString {
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : color,
            NSForegroundColorAttributeName : UIColor.white,
            NSStrokeWidthAttributeName : -width,
            NSFontAttributeName : UIFont.boldSystemFont(ofSize: CGFloat(size))
            ] as [String : Any]
        return NSMutableAttributedString(string: name, attributes: strokeTextAttributes)

    }
}
