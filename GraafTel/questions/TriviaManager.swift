//
//  TriviaManager.swift
//  questions
//
//  Created by C. Kyriakides on 09/03/2023.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    
    @Published private(set) var answerSelected = false // to let us know if the user selected an answer
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=9") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.sync {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false 
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
    func goToNextQestion() {
        if index + 1 < length {
            index += 1
            // Setting new question here
            setQuestion()
        } else {
                reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false // in case it was previously set to true
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion // formattedQuestion will convert the markdown to readable text
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
}