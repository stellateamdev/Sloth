//
//  StageViewCollectionViewCell.swift
//  Puzzle
//
//  Created by marky RE on 5/2/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class StageViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var number:UILabel!
    @IBOutlet weak var view:UIView!
    @IBOutlet weak var lockImage:UIImageView!
    
    var won:Bool!{
        didSet{
            self.number.textColor = UIColor.white
            self.view.backgroundColor = won == true ? UIColor.played() : UIColor.play()
        }
    }
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.backgrounds()
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = UIColor.play()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        
        lockImage.isHidden = true
        lockImage.image = UIImage(named: "lock")
        lockImage.tintColor = UIColor.white
        
        number.textColor = UIColor.darkGray
        number.font = UIFont(name: "Arial Rounded MT Bold", size: 37)
        
        addShadow()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.lockImage.isHidden = false
        self.number.isHidden = false
    }
    
    func addShadow() {
        self.view.layer.masksToBounds = false
        self.view.clipsToBounds = false
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowOpacity = 0.25
        self.view.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.view.layer.shadowRadius = 6
       
        self.view.layer.shadowPath =  UIBezierPath(roundedRect: self.view.bounds, cornerRadius: 10).cgPath
        self.view.layer.shouldRasterize = false
    }
}
