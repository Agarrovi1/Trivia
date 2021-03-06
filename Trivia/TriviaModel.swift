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
    func getScore() -> Int {
        return score
    }
    
    func makeRoundQuestions() {
        if questionPool.count - startIndex >= 10 {
            roundQuestions = Array(questionPool[startIndex...(startIndex + 9)])
        }
        startIndex += 10
    }
    func getNewCurrentQuestion() {
        currentQuestion = roundQuestions.popLast()
    }
    func showCurrentQuestion() -> Question? {
        return currentQuestion
    }
    func isRoundQuestionsEmpty() -> Bool {
        return roundQuestions.isEmpty
    }
    func answer(isCorrect: Bool) {
        if isCorrect {
            addScore()
        }
    }
    func isQuestionPoolEmpty() -> Bool {
        if questionPool.count - startIndex < 10 {
            return true
        } else {
            return false
        }
    }
    
}

