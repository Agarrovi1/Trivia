//
//  HomeScreenVC.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/30/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {
    //MARK: - UIObjects
    var triviaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Trivia"
        label.backgroundColor = .clear
        return label
    }()
    var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 3
        button.backgroundColor = .white
        return button
    }()
    
    //MARK: - Constraints
    private func addHomeConstraints() {
        constrainTriviaLabel()
        constrainStartButton()
    }
    private func constrainTriviaLabel() {
        view.addSubview(triviaLabel)
        triviaLabel.translatesAutoresizingMaskIntoConstraints = false
        triviaLabel.font = UIFont.systemFont(ofSize: 60)
        NSLayoutConstraint.activate([
            triviaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            triviaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            triviaLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            triviaLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)])
    }
    private func constrainStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.titleLabel?.adjustsFontSizeToFitWidth = true
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)])
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        addHomeConstraints()
    }
    

}
