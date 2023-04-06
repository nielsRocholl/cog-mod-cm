import Foundation
import SwiftUI

var levelScores: [CGFloat] = Array(repeating: 0.0, count: 7)

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    // used for MPC answers
    @Published private(set) var answerChoices: [Answer] = []
    // used to compute the percentage of correct question of a given level
    @Published private(set) var progress: CGFloat = 0.00
    // array filled with floats that represent the percentage of correct questions per level
    @Published var levelScores: [CGFloat] = Array(repeating: 0.0, count: 7)
    // array filled with integers that represent the number of correct questions per level
    @Published var levelIndividualScores: [Int] = Array(repeating: 0, count: 7)
    // sets the current level
    @Published var currentLevel = 1
    // keeps track of the last question you answered
    @Published var lastAnsweredQuestion: [Int: Int] = [:] // Add this line
    // Initialize the max range of the questions
    private var range: Range<Int> = 0..<50
    // Check if the current question is MPC
    var isMultipleChoice: Bool {
        trivia[index].type == "multiple_choice"
    }
    
    // load the unit of the current question, can be "None" it he question has no unit
    var currentUnit: String? {
        trivia[index].unit
    }

    // load the name of the current image (if it exists), can be "" (empty string)
    var currentImage: String? {
        trivia[index].img
    }
    
    // Initilize TriviaManager
    init() {
        
    }
    
    // Used to update the TriviaManager variavles according to the current level
    func prepareForLevel(_ level: Int) {
        self.currentLevel = level
        self.range = TriviaManager.getRangeForLevel(currentLevel: self.currentLevel)
        Task.init {
            await fetchTrivia()
        }
    }
    
    // Load the question data from the json file
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
                self.index = lastAnsweredQuestion[currentLevel] ?? 0 // Modify this line
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
    
    // Go to next question of a given level
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            lastAnsweredQuestion[currentLevel] = index // Add this line
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
            levelIndividualScores[currentLevel - 1] += 1 // Update this line
            updateLevelScore()
            return true
        }

        return false
    }

    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            levelIndividualScores[currentLevel - 1] += 1 // Update this line
            updateLevelScore()
        }
    }

    func updateLevelScore() {
        levelScores[currentLevel - 1] = (CGFloat(levelIndividualScores[currentLevel - 1]) / CGFloat(length) * 100).rounded() / 100
    }

    static func getRangeForLevel(currentLevel: Int) -> Range<Int> {
        let startIndex = (currentLevel - 1) * 7
        let endIndex = startIndex + 7
        return startIndex..<endIndex
    }


}
