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
    @IBOutlet weak var questionLabel:UILabel!
    var hintView:HintView!
    var resultView:ResultView!
    var greyView = UIView()
    var questionNumValue = 0
    var keyboardHeight:CGFloat = 0.0
    var question = Question()
    override func viewWillAppear(_ animated: Bool) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewWillAppear()
        self.view.isUserInteractionEnabled = true
        
        answer.delegate = self
        answer.returnKeyType = .go
        NotificationCenter.default.addObserver(self, selector: #selector(QuestionViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(QuestionViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        questionText.text = question.question
        hintView.hintTextView.text = question.hint
        questionText.font = UIFont(name: "Arial Rounded MT Bold" ,size: 20)
        questionText.isHidden = true
        questionLabel.text = question.question
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { _ in
                        self.questionLabel.alpha = 1.0
        }, completion: {_ in
           self.questionLabel.alpha = 1.0
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @IBAction func previousView(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func showHint() {
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
    func checkAnswer(answer:String) {
        self.view.frame.origin.y += keyboardHeight - 130
        
        if answer == question.answer {
            questions[questionNumValue-1].won = true
            resultView.title.text = "Correct"
            resultView.resultText.text = "Excellent thinking!"
            resultView.proceed.addTarget(self, action: #selector(QuestionViewController.shouldGoBack(sender:)), for: .touchUpInside)
            resultView.proceed.setTitle("Proceed", for: .normal)
            resultView.proceed.tag = 1
        }
        else {
            resultView.title.text = "Incorrect"
            resultView.resultText.text = "Check the hint!"
            resultView.proceed.addTarget(self, action: #selector(QuestionViewController.shouldGoBack(sender:)), for: .touchUpInside)
            resultView.proceed.tag = 0
            resultView.proceed.setTitle("OK", for: .normal)
        }
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
    func shouldGoBack(sender:UIButton) {
        if sender.tag == 0 {
            //resultView.removeFromSuperview()
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
        else{
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: questions)
            UserDefaults.standard.set(encodedData, forKey: "questions")
            UserDefaults.standard.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension QuestionViewController{
    func prepareViewWillAppear() {
        backButton.tintColor = UIColor.play()
        
        questionLabel.numberOfLines = 0
        questionLabel.lineBreakMode = .byWordWrapping
        questionLabel.textAlignment = .left
        questionLabel.sizeToFit()
        questionLabel.textColor = UIColor.white
        questionLabel.alpha = 0.0
        
        answer.placeholder = "Answer here"
        questionNum.attributedText = questionNum.createOutLine(name: "\(questionNumValue)")
        
        answer.layer.borderColor = UIColor(red: 87/255, green: 121/255, blue: 161/255, alpha: 1).cgColor
        answer.layer.borderWidth = 2
        answer.layer.cornerRadius = 5.0
        answer.addShadow()
        answer.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        
        questionNum.font = UIFont(name: "Arial Rounded MT Bold", size: 45)
        /*questionNum.shadowColor = UIColor.play()//UIColor.init(white: 0.45, alpha: 1)
        questionNum.shadowOffset = CGSize.init(width: 2.5, height: 2.5)
        questionNum.textColor = UIColor.black */
       /* questionText.font =  UIFont(name: "Arial Rounded MT Bold", size: 15)
        questionText.isEditable = false
        questionText.isScrollEnabled = false
        questionText.textColor = UIColor.white
        questionText.backgroundColor = UIColor.backgrounds()
        questionText.alpha = 0.0 */
        
        
        
        greyView.frame = self.view.frame
        greyView.backgroundColor = UIColor.darkGray
        greyView.alpha = 0.0
        greyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(QuestionViewController.closeHint)))
        hintView =  XibView.instanceFromNib(name: "Hint") as! HintView
        hintView.frame.origin = CGPoint(x: self.view.frame.midX-125, y: self.view.frame.midY-125)
        hintView.layer.cornerRadius = 10
        hintView.alpha = 0.0
        hintView.close.addTarget(self, action: #selector(QuestionViewController.closeHint), for: .touchUpInside)
        
        resultView =  XibView.instanceFromNib(name: "Result") as! ResultView
        resultView.frame.origin = CGPoint(x: self.view.frame.midX-125, y: self.view.frame.midY-125)
        resultView.layer.cornerRadius = 10
        resultView.alpha = 0.0
        resultView.layer.borderColor = UIColor.black.cgColor
        resultView.layer.borderWidth = 2.0
        
        hint.backgroundColor = UIColor.play()
        hint.layer.borderWidth = 2
        hint.layer.borderColor = UIColor.white.cgColor
        hint.addShadow()
        hint.setTitleColor(UIColor.white, for: .normal)
        hint.layer.cornerRadius = 5.0
        hint.layer.shouldRasterize = false
        
        self.view.addSubview(greyView)
        self.view.addSubview(hintView)
        self.view.addSubview(resultView)
        self.view.backgroundColor = UIColor.backgrounds()
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
    override var prefersStatusBarHidden: Bool {
        return true
    }  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height - 85
            keyboardHeight = keyboardSize.height
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y += keyboardSize.height - 85
        }
    }
    
}

extension QuestionViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.checkAnswer(answer: textField.text!)
        return true
    }
}

