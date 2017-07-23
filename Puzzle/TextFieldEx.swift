//
//  TextFieldEx.swift
//  Puzzle
//
//  Created by marky RE on 6/15/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    
    func addShadow() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 6
        
        self.layer.shadowPath =  UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        self.layer.shouldRasterize = false
        
    }
    
    
     func textRectForBounds(bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func editingRectForBounds(bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
