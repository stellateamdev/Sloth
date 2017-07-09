//
//  ViewController.swift
//  Puzzle
//
//  Created by marky RE on 5/2/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit
import SwiftyStoreKit
class StageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var setting:UIButton!
    
    var purchaseView:PurchaseView!
    var greyView = UIView()
    var questionArray:[Question] = Questions().getQuestions()
    var isLock = true
    
    override func viewWillAppear(_ animated: Bool) {
        prepareViewWillAppear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stageCell", for: indexPath) as! StageViewCollectionViewCell
        cell.number.text = "\(indexPath.row+1)"
        if indexPath.row >= 3 && isLock {
                if  UserDefaults.standard.bool(forKey: "purchase") == true {
                            cell.checkIfWon(won: questions[indexPath.row].won )
                            cell.lockImage.isHidden = true
                }
                else {
                    cell.number.isHidden = true
                    cell.lockImage.isHidden = false
                }
        }
        else {
            cell.lockImage.isHidden = true
        cell.checkIfWon(won: questions[indexPath.row].won )
        }
        if indexPath.row == 4 {
             cell.lockImage.isHidden = true
            cell.number.isHidden = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "QuestionView") as! QuestionViewController

        if indexPath.row >= 3 && isLock {
            if UserDefaults.standard.bool(forKey: "purchase") == false {
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
        }
        else {
        view.question = questionArray[indexPath.row]
        view.questionNumValue = indexPath.row+1
        self.navigationController?.pushViewController(view, animated: true)
        }
        
    }

}

extension StageViewController {
    func prepareViewWillAppear() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 110, height: 110)
        
        self.view.backgroundColor = UIColor.backgrounds()///UIColor(red: 157/255, green: 202/255, blue: 218/255, alpha: 1)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.backgrounds()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        titleLabel.attributedText = titleLabel.createOutLine(name: "Sloth")
        titleLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 56)
       /* titleLabel.shadowColor = UIColor.play()//UIColor.init(white: 0.45, alpha: 1)
        titleLabel.shadowOffset = CGSize.init(width: 2.5, height: 2.5) */
        titleLabel.textColor = UIColor.white
        self.setting.isHidden = true
    }
    
    func prepareViewDidLoad() {
        getProduct()
        purchaseView =  XibView.instanceFromNib(name: "Purchase") as! PurchaseView
        purchaseView.frame.origin = CGPoint(x: self.view.frame.midX-137.5, y: self.view.frame.midY-100)
        purchaseView.layer.cornerRadius = 10
        purchaseView.alpha = 0.0
        purchaseView.layer.borderColor = UIColor.black.cgColor
        purchaseView.layer.borderWidth = 2.0
        purchaseView.buy.addTarget(self, action: #selector(StageViewController.purchaseProduct), for: .touchUpInside)
        purchaseView.restore.addTarget(self, action: #selector(StageViewController.restorePurchase), for: .touchUpInside)
        greyView.frame = self.view.frame
        greyView.backgroundColor = UIColor.darkGray
        greyView.alpha = 0.0
        greyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(StageViewController.closePurchase)))
        
        self.view.addSubview(greyView)
        self.view.addSubview(purchaseView)
        
        collectionView.reloadData()
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
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

extension StageViewController {
    func getProduct() {
        SwiftyStoreKit.retrieveProductsInfo(["com.stella.puzzler.unlockAllPuzzles"]) { result in
            print(result.retrievedProducts)
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("fuck up \(result.invalidProductIDs)")
            }
            else {
                print("Error: \(result.error)")
            }
        }
    }
    func purchaseProduct() {
        SwiftyStoreKit.purchaseProduct("com.stella.puzzler.unlockAllPuzzles",atomically: true, applicationUsername:"puzzler",completion: { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                }
            }
        })
    }
    func restorePurchase() {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedProducts.count > 0 {
                print("Restore Failed: \(results.restoreFailedProducts)")
            }
            else if results.restoredProducts.count > 0 {
                print("results fuck")
            }
            else {
                print("Nothing to Restore")
            }
        }
    }
    
}


