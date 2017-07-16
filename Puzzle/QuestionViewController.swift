//
//  QuestionViewController.swift
//  Puzzle
//
//  Created by marky RE on 5/3/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var backButton:UIButton!
    @IBOutlet weak var questionNum:UILabel!
    @IBOutlet weak var questionText:UITextView!
    @IBOutlet weak var answer:UITextField!
    @IBOutlet weak var hint:UIButton!
    @IBOutlet weak var result:ResultView!
    @IBOutlet weak var questionLabel:UILabel!
    
    let viewModel:QuestionViewModel! =  QuestionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        
        prepareViewWillAppear()
        
        self.view.isUserInteractionEnabled = true
        
        answer.delegate = self
        answer.returnKeyType = .go
        
        questionText.text = viewModel.question.question
        questionText.font = UIFont(name: "Arial Rounded MT Bold" ,size: 20)
        questionText.isHidden = true
        questionLabel.text = viewModel.question.question
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.questionLabel.alpha = 1.0
        }, completion: {_ in
            self.questionLabel.alpha = 1.0
        })
    }
    
    @IBAction func previousView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showHint() {
        viewModel.showHint()
    }
}

extension QuestionViewController{
    
    func prepareViewWillAppear() {
        
        self.viewModel.configureViews(self.view.frame)
        
        backButton.tintColor = UIColor.play()
        
        
        questionLabel.sizeToFit()
        
        answer.layer.borderColor = UIColor(red: 87/255, green: 121/255, blue: 161/255, alpha: 1).cgColor
        answer.layer.borderWidth = 2
        answer.layer.cornerRadius = 5.0
        answer.addShadow()
        
        questionNum.attributedText = questionNum.createOutLine(name: "\(viewModel.questionNumValue!)")
        questionNum.font = UIFont(name: "Arial Rounded MT Bold", size: 55)
        
        hint.backgroundColor = UIColor.play()
        hint.layer.borderWidth = 2
        hint.layer.borderColor = UIColor.white.cgColor
        hint.addShadow()
        hint.setTitleColor(UIColor.white, for: .normal)
        hint.layer.cornerRadius = 5.0
        hint.layer.shouldRasterize = false
        self.view.addSubview(viewModel.greyView)
        self.view.addSubview(viewModel.hintView)
        self.view.addSubview(viewModel.resultView)
        self.view.backgroundColor = UIColor.backgrounds()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension QuestionViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        viewModel.checkAnswer(answer: textField.text!)
        return true
    }
}

extension QuestionViewController:QuestionViewModelDelegate {
    
    func didAnswerCorrectly() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
