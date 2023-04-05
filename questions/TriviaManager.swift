import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false

    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    @Published var levelScores: [CGFloat] = Array(repeating: 0.0, count: 7) // Add this line
    @Published var currentLevel = 1

    
    private var range: Range<Int> = 0..<50
    
    var isMultipleChoice: Bool {
        trivia[index].type == "multiple_choice"
    }

    var currentUnit: String? {
        trivia[index].unit
    }
    
    var currentImage: String? {
        trivia[index].img
    }

    init() {
        }

    func prepareForLevel(_ level: Int) {
        self.currentLevel = level
        self.range = TriviaManager.getRangeForLevel(currentLevel: self.currentLevel)

        Task.init {
            await fetchTrivia()
        }
        }
    
    func fetchTrivia() async {
        do {
            guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
                print("Error: data.json file not found")
                return
            }
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode([Trivia.Result].self, from: data)

            DispatchQueue.main.sync {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false

                self.trivia = Array(decodedData[range])
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }

    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }

    func setQuestion() {
        answerSelected = false

        let totalQuestions = CGFloat(length)
        let questionsAnswered = CGFloat(index)
        progress = questionsAnswered / totalQuestions

        let currentQuestion = trivia[index]
        question = currentQuestion.formattedQuestion
        answerChoices = currentQuestion.answers.shuffled()
    }

    func processFillInBlankAnswer(_ answer: String) -> Bool {
        let correctAnswer = trivia[index].correctAnswer

        if answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            score += 1
            levelScores[currentLevel-1] = (CGFloat(score) / CGFloat(length) * 100).rounded() / 100
            return true
        }

        return false
    }


    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            levelScores[currentLevel-1] = (CGFloat(score) / CGFloat(length) * 100).rounded() / 100
            score += 1
        }
    }
    
    static func getRangeForLevel(currentLevel: Int) -> Range<Int> {
        let startIndex = (currentLevel - 1) * 7
        let endIndex = startIndex + 7
        return startIndex..<endIndex
    }
    
}

