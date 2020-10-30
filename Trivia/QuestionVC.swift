//
//  QuestionVC.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/29/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    //MARK: - UIObject
    
    var answerButtonZero = UIButton()
    var answerButtonOne = UIButton()
    var answerButtonTwo = UIButton()
    var answerButtonThree = UIButton()
    
    
    
    //MARK: - Functions
    private func updateButtonStyle(button: UIButton, tag: Int,title: String) {
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.purple.cgColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = tag
    
    }
    //MARK: - Setup
    private func setupButtons() {
        
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
