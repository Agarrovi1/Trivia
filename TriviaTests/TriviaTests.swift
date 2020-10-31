//
//  TriviaTests.swift
//  TriviaTests
//
//  Created by Angela Garrovillas on 10/29/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import XCTest
@testable import Trivia

class TriviaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTriviaModelQuestions() {
        let isPoolEmpty = TriviaModel.shared.isQuestionPoolEmpty()
        XCTAssert(!isPoolEmpty)
        
        var isRoundEmpty = TriviaModel.shared.isRoundQuestionsEmpty()
        XCTAssert(isRoundEmpty) // should be empty at start
        
        TriviaModel.shared.makeRoundQuestions() //now round should have questions
        isRoundEmpty = TriviaModel.shared.isRoundQuestionsEmpty()
        XCTAssert(!isRoundEmpty)
    }

}
