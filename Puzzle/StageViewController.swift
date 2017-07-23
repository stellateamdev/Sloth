//
//  ViewController.swift
//  Puzzle
//
//  Created by marky RE on 5/2/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class StageViewController: UIViewController {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var setting:UIButton!
    
    let viewModel = StageViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareViewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.configureViews(self.view.frame)
        
        prepareViewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func prepareViewWillAppear() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: 110, height: 110)
        
        self.view.backgroundColor = UIColor.backgrounds()
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.backgrounds()
        collectionView.delegate = self
        collectionView.dataSource = self.viewModel
        
        titleLabel.attributedText = titleLabel.createOutLine(name: "Sloth", size: 30, width: 2.5, color: UIColor.played())
        titleLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 56)
        titleLabel.textColor = UIColor.white
        
        self.setting.isHidden = true
    }
    
    func prepareViewDidLoad() {
        InAppManager.getProduct()
        self.view.addSubview(self.viewModel.greyView)
        self.view.addSubview(self.viewModel.purchaseView)
        collectionView.reloadData()
    }
}

extension StageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "QuestionView") as! QuestionViewController
        if indexPath.row >= 3 && self.viewModel.isLock {
            if UserDefaults.standard.bool(forKey: "purchase") == false {
                self.viewModel.showPurchase()
            }
        }
        else {
            view.viewModel.question = self.viewModel.questionArray[indexPath.row]
            view.viewModel.questionNumValue = indexPath.row+1
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
