//
//  ButtonEx.swift
//  Puzzle
//
//  Created by marky RE on 6/15/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
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
    func addBackShadow() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 0.25)
        self.layer.shadowRadius = 2
        
        self.layer.shadowPath =  UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        self.layer.shouldRasterize = false
    }

}
