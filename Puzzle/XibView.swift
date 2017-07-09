//
//  ViewExtension.swift
//  Puzzle
//
//  Created by marky RE on 5/29/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class XibView:UIView {
    class func instanceFromNib(name:String) -> UIView {
        return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
