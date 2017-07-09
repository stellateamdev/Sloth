//
//  Question.swift
//  Puzzle
//
//  Created by marky RE on 5/29/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation

class Question:NSObject,NSCoding {
    private var _question:String?
    private var _hint:String?
    private var _won:Bool?
    private var _answer:String?
    var question:String {
        get {
            return _question!
        }
        set {
            _question = newValue
        }
    }
    var hint:String {
        get {
            return _hint!
        }
        set {
            _hint = newValue
        }
    }
    var won:Bool {
        get {
            return _won!
        }
        set {
            _won = newValue
        }
    }
    var answer:String {
        get {
            return _answer!
        }
        set {
            _answer = newValue
        }
    }
    override init() {
        _question = ""
        _hint = ""
        _won = false
        _answer = ""
    }
    init(q:String?="",h:String?="",w:Bool?=false,ans:String?="") {
        _question = q
        _hint = h
        _won = w
        _answer = ans
    }
    
    required init(coder decoder: NSCoder) {
        _question = decoder.decodeObject(forKey: "question") as? String ?? ""
        _hint = decoder.decodeObject(forKey: "hint") as? String ?? ""
        _answer = decoder.decodeObject(forKey: "answer") as? String ?? ""
        _won = decoder.decodeObject(forKey: "won") as? Bool ?? false
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(_question, forKey: "question")
        coder.encode(_hint, forKey: "hint")
        coder.encode(_answer, forKey: "answer")
        coder.encode(_won, forKey: "won")
    }

}
