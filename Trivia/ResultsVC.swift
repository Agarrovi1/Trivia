//
//  ResultsVC.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/30/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    //MARK: - UIObjects
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Score:\n \(TriviaModel.shared.getScore())"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play another round?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        button.backgroundColor = .white
        button.titleLabel?.numberOfLines = 3
        button.titleLabel?.textAlignment = .center
        button.setTitle("Finished!\n Thank you for playing!", for: .disabled)
        return button
    }()
    
    //MARK: - Constraints
    private func setAllConstraints() {
        constrainScoreLabel()
        constrainPlayButton()
    }
    private func constrainScoreLabel() {
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 60)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            scoreLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func constrainPlayButton() {
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: view.centerYAnchor,constant: view.frame.height * 0.05),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)])
    }
    private func changeButtonLabel() {
        if TriviaModel.shared.isQuestionPoolEmpty() {
            playButton.isEnabled = false
            playButton.layer.borderColor = UIColor.clear.cgColor
            playButton.backgroundColor = .clear
        }
    }
    //MARK: - Objc Methods
    @objc private func playButtonPressed() {
        TriviaModel.shared.makeRoundQuestions()
        TriviaModel.shared.getNewCurrentQuestion()
        let qVC = QuestionVC()
        navigationController?.pushViewController(qVC, animated: true)
    }

    //MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8648820519, green: 0.3310557417, blue: 0.5348803558, alpha: 1)
        setAllConstraints()
        changeButtonLabel()

    }
    

}
