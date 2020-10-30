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
            hideButton()
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
    
    var nextButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: UIImage.SymbolWeight.medium)
        let arrow = UIImage(systemName: "arrow.right.circle", withConfiguration: config)
        button.setImage(arrow, for: .normal)
        button.isHidden = true
        return button
    }()
    
    var answerStackView = UIStackView()
    
    
    
    //MARK: - Functions
    private func updateButtonStyle(button: UIButton, tag: Int,title: String) {
        view.addSubview(button)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
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
        
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    }
    private func answerWrong() {
        let buttons = [answerButtonZero,answerButtonOne,answerButtonTwo,answerButtonThree]
        for button in buttons {
            button.isEnabled = false
            if button.titleLabel!.text == question.correct {
                button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            }
        }
    }
    private func disableButtons() {
        let buttons = [answerButtonZero,answerButtonOne,answerButtonTwo,answerButtonThree]
        for button in buttons {
            button.isEnabled = false
        }
    }
    private func hideButton() {
        if answers.count == 3 {
            answerButtonThree.isHidden = true
        }
    }
    //MARK: - Objc Functions
    @objc private func answerPressed(sender: UIButton) {
        nextButton.isHidden = false
        if sender.titleLabel!.text == question.correct {
            sender.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            disableButtons()
            TriviaModel.shared.answer(isCorrect: true)
        } else {
            answerWrong()
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    @objc private func nextButtonPressed() {
        if !TriviaModel.shared.isRoundQuestionsEmpty() {
            TriviaModel.shared.getNewCurrentQuestion()
            let qVC = QuestionVC()
            navigationController?.pushViewController(qVC, animated: true)
        } else {
            let resultVC = ResultsVC()
            navigationController?.pushViewController(resultVC, animated: true)
        }
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
        for index in 0..<question.allAnswers.count {
            let button = buttons[index]
            button.setTitle(answers[index], for: .normal)
            
        }
    }
    
    private func addConstraints() {
        constrainStackView()
        constrainNextButton()
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
            questionLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 10),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            questionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)])
    }
    private func constrainNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)])
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
