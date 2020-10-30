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
    
    var answerStackView = UIStackView()
    
    
    
    //MARK: - Functions
    private func updateButtonStyle(button: UIButton, tag: Int,title: String) {
        view.addSubview(button)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.purple.cgColor
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = tag
    
    }
    //MARK: - Setup
    private func setupButtons() {
        updateButtonStyle(button: answerButtonZero, tag: 0, title: "zero")
        updateButtonStyle(button: answerButtonOne, tag: 1, title: "one")
        updateButtonStyle(button: answerButtonTwo, tag: 2, title: "two")
        updateButtonStyle(button: answerButtonThree, tag: 3, title: "three")
    }
    
    private func addConstraints() {
        constrainStackView()
    }
    
    private func constrainStackView() {
        answerStackView.addArrangedSubview(answerButtonZero)
        answerStackView.addArrangedSubview(answerButtonOne)
        answerStackView.addArrangedSubview(answerButtonTwo)
        answerStackView.addArrangedSubview(answerButtonThree)
        
        answerStackView.axis = .vertical
        answerStackView.spacing = 30
        answerStackView.distribution = .fillEqually
        view.addSubview(answerStackView)
        answerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            answerStackView.topAnchor.constraint(equalTo: view.centerYAnchor),
            answerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            answerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)])
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtons()
        constrainStackView()

    }
    

    

}
