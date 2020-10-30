//
//  QuestionVC.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/29/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    //MARK: Properties
    var question: Question = Question(question: "", incorrect: [], correct: "") {
        didSet {
            answers = question.getShuffledAnswers()
        }
    }
    var answers = [String]() {
        didSet {
            setQuestionAndAnswers()
        }
    }
    
    //MARK: - UIObject
    var questionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.blue.cgColor
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 5
        label.text = "Title"
        return label
    }()
    
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
    private func addButtonTargets() {
        answerButtonZero.addTarget(self, action: #selector(answerPressed(sender:)), for: .touchUpInside)
        answerButtonOne.addTarget(self, action: #selector(answerPressed(sender:)), for: .touchUpInside)
        answerButtonTwo.addTarget(self, action: #selector(answerPressed(sender:)), for: .touchUpInside)
        answerButtonThree.addTarget(self, action: #selector(answerPressed(sender:)), for: .touchUpInside)
    }
    
    //MARK: - Objc Functions
    @objc private func answerPressed(sender: UIButton) {
        TriviaModel.shared.answer(sender.tag)
    }
    
    //MARK: - Setup
    private func setupButtons() {
        updateButtonStyle(button: answerButtonZero, tag: 0, title: "zero")
        updateButtonStyle(button: answerButtonOne, tag: 1, title: "one")
        updateButtonStyle(button: answerButtonTwo, tag: 2, title: "two")
        updateButtonStyle(button: answerButtonThree, tag: 3, title: "three")
    }
    private func getQuestion() {
        if let q = TriviaModel.shared.showCurrentQuestion() {
            question = q
        }
    }
    private func setQuestionAndAnswers() {
        questionLabel.text = question.question
        let buttons = [answerButtonZero,answerButtonOne,answerButtonTwo,answerButtonThree]
        print(answers)
        for index in 0..<question.allAnswers.count {
            let button = buttons[index]
            button.setTitle(answers[index], for: .normal)
            
        }
    }
    
    private func addConstraints() {
        constrainStackView()
        constrainQuestionLabel()
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
    
    private func constrainQuestionLabel() {
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            questionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)])
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtons()
        addConstraints()
        addButtonTargets()
        getQuestion()

    }
    

    

}
