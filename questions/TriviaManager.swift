import Foundation
import SwiftUI

var levelScores: [CGFloat] = Array(repeating: 0.0, count: 7)

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
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
    // array filled with bools that check if the level end is reached
    @Published private(set) var reachedEnd: [Bool] = Array(repeating: false, count: 7) // Update this line
    // sets the current level
    @Published var currentLevel = 1
    // keeps track of the last question you answered
    @Published var lastIncorrectlyAnswered: [[Int]] = Array(repeating: [], count: 7)
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
            self.reachedEnd[currentLevel - 1] = (levelIndividualScores[currentLevel - 1] == range.count)

            // Update the index and clear the lastIncorrectlyAnswered sublist for the current level
            if lastIncorrectlyAnswered[currentLevel - 1].isEmpty {
                self.index = 0
            } else {
                self.index = lastIncorrectlyAnswered[currentLevel - 1][0]
            }
            print("index: ", self.index, "Last incorrect: ", lastIncorrectlyAnswered[currentLevel - 1])
//            lastIncorrectlyAnswered[currentLevel - 1].removeAll()

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
//                self.index = lastIncorrectlyAnswered[currentLevel - 1] // Modify this line
                // THIS NEXT LINE Is A TEST
                self.reachedEnd[currentLevel - 1] = (levelIndividualScores[currentLevel - 1] == range.count) // Update this line
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
            setQuestion()
        } else {
            reachedEnd[currentLevel - 1] = true // Update this line
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
        print(lastIncorrectlyAnswered[currentLevel - 1])
    }

    func processFillInBlankAnswer(_ answer: String) -> Bool {
        let correctAnswer = trivia[index].correctAnswer

        if answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            levelIndividualScores[currentLevel - 1] += 1
            updateLevelScore()

            if lastIncorrectlyAnswered[currentLevel - 1].last == index {
                lastIncorrectlyAnswered[currentLevel - 1].removeAll()
            }
            return true
        } else {
            lastIncorrectlyAnswered[currentLevel - 1].append(index)
            return false
        }
    }


    func processMPCAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            levelIndividualScores[currentLevel - 1] += 1
            updateLevelScore()

            if lastIncorrectlyAnswered[currentLevel - 1].last == index {
                lastIncorrectlyAnswered[currentLevel - 1].removeAll()
            }
        }
        else {
            lastIncorrectlyAnswered[currentLevel - 1].append(index)
        }
    }

    func updateLevelScore() {
        levelScores[currentLevel - 1] = (CGFloat(levelIndividualScores[currentLevel - 1]) / CGFloat(length) * 100).rounded() / 100
    }

    static func getRangeForLevel(currentLevel: Int) -> Range<Int> {
        let startIndex = (currentLevel - 1) * 4
        let endIndex = startIndex + 4
        return startIndex..<endIndex
    }
    
}
