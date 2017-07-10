//
//  StageViewModel.swift
//  Puzzle
//
//  Created by Nathakorn on 7/10/17.
//  Copyright © 2017 marky RE. All rights reserved.
//

import Foundation
import UIKit

class StageViewModel: NSObject {
    
    var purchaseView:PurchaseView!
    var greyView = UIView()
    var questionArray:[Question] = QuestionsManager.sharedInstance.questions
    var isLock = true
    
    override init() {
        super.init()
    }
    
    func configureViews(_ frame:CGRect){
        
        purchaseView =  XibView.instanceFromNib(name: "Purchase") as! PurchaseView
        purchaseView.frame.origin = CGPoint(x: frame.midX-137.5, y: frame.midY-100)
        purchaseView.layer.cornerRadius = 10
        purchaseView.alpha = 0.0
        purchaseView.layer.borderColor = UIColor.black.cgColor
        purchaseView.layer.borderWidth = 2.0
        purchaseView.buy.addTarget(self, action: #selector(purchaseProduct), for: .touchUpInside)
        purchaseView.restore.addTarget(self, action: #selector(restorePurchase), for: .touchUpInside)
        
        greyView.frame = frame
        greyView.backgroundColor = UIColor.darkGray
        greyView.alpha = 0.0
        greyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePurchase)))
        
    }
    
    func purchaseProduct(){
        InAppManager.purchaseProduct()
    }
    
    func restorePurchase(){
        InAppManager.restorePurchase()
    }
}

// Animations Handling
extension StageViewModel {
    
    func showPurchase(){
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.purchaseView.alpha = 1.0
                        self.greyView.alpha = 0.8
        }, completion: {_ in
            self.purchaseView.alpha = 1.0
            self.greyView.alpha = 0.8
            
        })
    }
    
    func closePurchase() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.purchaseView.alpha = 0.0
                        self.greyView.alpha = 0.0
        }, completion: {_ in
            self.purchaseView.alpha = 0.0
            self.greyView.alpha = 0.0
        })
    }
}

//CollectionViewDataSource
extension StageViewModel: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.questionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stageCell", for: indexPath) as! StageViewCollectionViewCell
        cell.number.text = "\(indexPath.row+1)"
        cell.won = self.questionArray[indexPath.row].won
        if indexPath.row >= 3 && isLock {
            if  UserDefaults.standard.bool(forKey: "purchase") {
                cell.lockImage.isHidden = true
            }
            else {
                cell.number.isHidden = true
                cell.lockImage.isHidden = false
            }
        }
        else {
            cell.lockImage.isHidden = true
        }
        return cell
    }
}
