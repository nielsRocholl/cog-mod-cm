import Foundation
import SwiftUI


class CognitiveModel: ObservableObject {
    private(set) var trivia: [Questions.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    
    let levelAccess: [[Int]] = [
            [2],
            [1, 3, 4],
            [2, 5, 6],
            [2, 6],
            [3, 7],
            [3, 4, 7],
            [5, 6]
        ]

    @Published var unlockedLevels: [Bool] = Array(repeating: false, count: 7)
    // used for MPC answers
    @Published private(set) var answerChoices: [Answer] = []
    // hint for the user
    @Published private(set) var hint: String = ""
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
    // keeps track of the last questions you answered incorrectly
    @Published var lastIncorrectlyAnswered: [[Int]] = Array(repeating: [], count: 7)
    // keeps track of the questions you answered correctly
    @Published var lastCorrectlyAnswered: [[Int]] = Array(repeating: [], count: 7)
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
        selectRandomStudentScores()
        updateUnlockedLevels() // Call this upon initialization
        // to prevent index error
        prepareForLevel(1)
    }

    // Used to update the TriviaManager variavles according to the current level
    func prepareForLevel(_ level: Int) {
            self.currentLevel = level
            self.range = CognitiveModel.getRangeForLevel(currentLevel: self.currentLevel)
            self.reachedEnd[currentLevel - 1] = (levelIndividualScores[currentLevel - 1] == range.count)

            if lastIncorrectlyAnswered[currentLevel - 1].isEmpty {
                if lastCorrectlyAnswered[currentLevel - 1].count == range.count {
                    self.index = 0
                } else {
                    self.index = lastCorrectlyAnswered[currentLevel - 1].count
                }
            } else {
                self.index = lastIncorrectlyAnswered[currentLevel - 1][0]
            }
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
            let decodedData = try decoder.decode([Questions.Result].self, from: data)

            DispatchQueue.main.sync {
                self.reachedEnd[currentLevel - 1] = (levelIndividualScores[currentLevel - 1] == range.count) // Update this line
                self.trivia = Array(decodedData[range])
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
        print(range)
    }

    // Go to next question of a given level
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            // Skip questions that have already been answered correctly
            while lastCorrectlyAnswered[currentLevel - 1].contains(index) && index + 1 < length {
                index += 1
            }
            if index >= length {
                reachedEnd[currentLevel - 1] = true
            } else {
                setQuestion()
            }
        } else {
            reachedEnd[currentLevel - 1] = true
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
        hint = currentQuestion.hint
    }


    func processFillInBlankAnswer(_ answer: String) -> Bool {
        let correctAnswer = trivia[index].correctAnswer

        if answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == correctAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            levelIndividualScores[currentLevel - 1] += 1
            updateLevelScore()
            
            // if current question is in lastIncorrectlyAnswered, but is now answered correctly, then remove it from the list
            if let currentIndex = lastIncorrectlyAnswered[currentLevel - 1].firstIndex(of: index) {
                lastIncorrectlyAnswered[currentLevel - 1].remove(at: currentIndex)
            }
            // add question to lastCorrectlyAnswered if correctly answered and not already in there
            if !lastCorrectlyAnswered[currentLevel - 1].contains(index) {
                    lastCorrectlyAnswered[currentLevel - 1].append(index)
            }
            return true
        }
        // if question is answered incorrectly and not in lastIncorrectlyAnswered, add it
        else if !lastIncorrectlyAnswered[currentLevel - 1].contains(index){
            lastIncorrectlyAnswered[currentLevel - 1].append(index)
            return false
        }
        return false
    }


    func processMPCAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            levelIndividualScores[currentLevel - 1] += 1
            updateLevelScore()

            // if current question is in lastIncorrectlyAnswered, but is now answered correctly, then remove it from the list
            if let currentIndex = lastIncorrectlyAnswered[currentLevel - 1].firstIndex(of: index) {
                lastIncorrectlyAnswered[currentLevel - 1].remove(at: currentIndex)
            }
            // add question to lastCorrectlyAnswered if correctly answered and not already in there
            if !lastCorrectlyAnswered[currentLevel - 1].contains(index) {
                    lastCorrectlyAnswered[currentLevel - 1].append(index)
            }
        }
        // if question is answered incorrectly and not in lastIncorrectlyAnswered, add it
        else if !lastIncorrectlyAnswered[currentLevel - 1].contains(index){
            lastIncorrectlyAnswered[currentLevel - 1].append(index)
        }
    }

    func updateLevelScore() {
        let newScore = (CGFloat(levelIndividualScores[currentLevel - 1]) / CGFloat(length) * 100).rounded() / 100
        if newScore > levelScores[currentLevel - 1] {
            levelScores[currentLevel - 1] = newScore
        }
        updateUnlockedLevels()
    }

    static func getRangeForLevel(currentLevel: Int) -> Range<Int> {
        let startIndex = (currentLevel - 1) * 4
        let endIndex = startIndex + 4
        return startIndex..<endIndex
    }
    
    func selectRandomStudentScores() {
            let initialTestResults = InitialTestResults()
            let studentScores = [initialTestResults.student1, initialTestResults.student2, initialTestResults.student3, initialTestResults.student4, initialTestResults.student5, initialTestResults.student6, initialTestResults.student7, initialTestResults.student8]
            
            if let randomStudentScores = studentScores.randomElement() {
                levelScores = randomStudentScores.map { CGFloat($0) }
            }
    }
    
    // Add this function to update the unlocked levels based on level scores
    func updateUnlockedLevels() {
            // Always unlock Level 1
            unlockedLevels[0] = true
            for (index, levelScore) in levelScores.enumerated() {
                // If the level score is >= 75%, unlock the level itself
                if levelScore >= 0.75 {
                    unlockedLevels[index] = true
                    
                    // Unlock the connected levels
                    for connectedLevel in levelAccess[index] {
                        unlockedLevels[connectedLevel - 1] = true
                    }
                }
            }
        }

}

struct InitialTestResults{
    let student1: [Double] = [1.0, 0.76, 0.9, 0.67, 0.4, 0.52, 0.24]
    let student2: [Double] = [1.0, 0.67, 0.62, 0.0, 0.24, 0.33, 0.1]
    let student3: [Double] = [1.0, 0.95, 0.67, 0.0, 0.81, 0.19, 0.24]
    let student4: [Double] = [1.0, 0.81, 0.48, 0.1, 0.29, 0.67, 0.14]
    let student5: [Double] = [1.0, 0.19, 0.19, 0.0, 0.05, 0.0, 0.05]
    let student6: [Double] = [1.0, 0.48, 0.14, 0.0, 0.1, 0.14, 0.0]
    let student7: [Double] = [1.0, 0.81, 0.52, 0.0, 0.29, 0.43, 0.05]
    let student8: [Double] = [1.0, 0.38, 0.67, 0.0, 0.29, 0.67, 0.1]
}
