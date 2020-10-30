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
        label.text = "Results:\n \(TriviaModel.shared.getScore())"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    //MARK: - Constraints
    private func setAllConstraints() {
        constrainScoreLabel()
    }
    private func constrainScoreLabel() {
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.2),
            scoreLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            scoreLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    //MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8688890338, blue: 0.8717179298, alpha: 1)
        setAllConstraints()

    }
    

}
