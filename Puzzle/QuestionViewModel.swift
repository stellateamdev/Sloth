//
//  QuestionViewModel.swift
//  Puzzle
//
//  Created by Nathakorn on 7/10/17.
//  Copyright © 2017 marky RE. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionViewModelDelegate: class {
    func didAnswerCorrectly() -> Void
}

class QuestionViewModel: NSObject {
    
    var hintView:HintView!
    var resultView:ResultView!
    var greyView = UIView()
    var questionNumValue:Int!
    var question:Question!
    
    weak var delegate:QuestionViewModelDelegate?

    func configureViews(_ frame:CGRect){
        
        greyView.frame = frame
        greyView.backgroundColor = UIColor.darkGray
        greyView.alpha = 0.0
        greyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeHint)))
        
        hintView =  XibView.instanceFromNib(name: "Hint") as! HintView
        hintView.frame.origin = CGPoint(x: frame.midX-125, y: frame.midY-125)
        hintView.layer.cornerRadius = 10
        hintView.alpha = 0.0
        hintView.close.addTarget(self, action: #selector(closeHint), for: .touchUpInside)
        hintView.hintTextView.text = self.question.hint
        
        resultView =  XibView.instanceFromNib(name: "Result") as! ResultView
        resultView.frame.origin = CGPoint(x: frame.midX-125, y: frame.midY-125)
        resultView.layer.cornerRadius = 10
        resultView.alpha = 0.0
        resultView.layer.borderColor = UIColor.black.cgColor
        resultView.layer.borderWidth = 2.0
        
    }
    
    func checkAnswer(answer:String) {
        var questions = QuestionsManager.sharedInstance.questions
        if answer == question.answer {
            questions[questionNumValue-1].won = true
            resultView.title.text = "Correct"
            resultView.resultText.text = "Excellent thinking!"
            resultView.proceed.addTarget(self, action: #selector(shouldGoBack(sender:)), for: .touchUpInside)
            resultView.proceed.setTitle("Proceed", for: .normal)
            resultView.proceed.tag = 1
        }
        else {
            resultView.title.text = "Incorrect"
            resultView.resultText.text = "Check the hint!"
            resultView.proceed.addTarget(self, action: #selector(shouldGoBack(sender:)), for: .touchUpInside)
            resultView.proceed.tag = 0
            resultView.proceed.setTitle("OK", for: .normal)
        }
        showResult()
    }
    
    func shouldGoBack(sender:UIButton) {
        if sender.tag == 0 {
            self.closeResult()
        }
        else{
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: QuestionsManager.sharedInstance.questions)
            UserDefaults.standard.set(encodedData, forKey: "questions")
            UserDefaults.standard.synchronize()
            self.delegate?.didAnswerCorrectly()
        }
    }
}

//Animations handling
extension QuestionViewModel {
    
    func showHint() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.hintView.alpha = 1.0
                        self.greyView.alpha = 0.8
                        
        }, completion: {_ in
            self.hintView.alpha = 1.0
            self.greyView.alpha = 0.8
        })
    }
    
    func closeHint() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.hintView.alpha = 0.0
                        self.greyView.alpha = 0.0
        }, completion: {_ in
            self.hintView.alpha = 0.0
            self.greyView.alpha = 0.0
        })
    }
    
    func showResult(){
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.greyView.alpha = 0.7
                        self.resultView.alpha = 1.0
        }, completion: {_ in
            self.greyView.alpha = 0.7
            self.resultView.alpha = 1.0
            
        })
    }
    
    func closeResult(){
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.greyView.alpha = 0.0
                        self.resultView.alpha = 0.0
        }, completion: {_ in
            self.greyView.alpha = 0.0
            self.resultView.alpha = 0.0
        })
    }
    
}
