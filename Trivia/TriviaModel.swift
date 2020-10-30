//
//  TriviaModel.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/30/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation
class TriviaModel {
    static let shared = TriviaModel()
    private var questionPool: [Question]
    private var roundQuestions: [Question] = []
    private var currentQuestion: Question?
    private var startIndex = 0
    private var score = 0
    
    init() {
        questionPool = Question.getAllQuestions().shuffled()
        
    }
    private func addScore() {
        score += 10
    }
    
    func makeRoundQuestions() {
        if questionPool.count - startIndex >= 10 {
            roundQuestions = Array(questionPool[startIndex...(startIndex + 9)])
        }
        startIndex += 10
    }
    func getCurrentQuestion() {
        currentQuestion = roundQuestions.popLast()
    }
    func showCurrentQuestion() -> Question? {
        return currentQuestion
    }
    func isRoundQuestionsEmpty() -> Bool {
        return roundQuestions.isEmpty
    }
    
}

