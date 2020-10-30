//
//  Question.swift
//  Trivia
//
//  Created by Angela Garrovillas on 10/30/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Question: Codable {
    var question: String
    var incorrect: [String]
    var correct: String
    var allAnswers: [String] {
        let allAnswers = incorrect + [correct]
        return allAnswers
    }
    
    static func getQuestions(from data: Data) throws -> [Question] {
        do {
            let questions = try JSONDecoder().decode([Question].self, from: data)
            return questions
        } catch {
            print("Error decoding questions: \(error)")
        }
        return []
    }
    static func getAllQuestions() -> [Question] {
        guard let pathToQuestionJSON = Bundle.main.path(forResource: "Apprentice_TandemFor400_Data", ofType: "json") else {
            print("guard of getQuestions in TriviaModel didn't work")
            return []
        }
        let url = URL(fileURLWithPath: pathToQuestionJSON)
        do {
            let data = try Data(contentsOf: url)
            let questionsFromJSON = try Question.getQuestions(from: data)
            return questionsFromJSON
        } catch {
            print(error)
        }
        return []
    }
    
    func getShuffledAnswers() -> [String] {
        return allAnswers.shuffled()
    }
}
