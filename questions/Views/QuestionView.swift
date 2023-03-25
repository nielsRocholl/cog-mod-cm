import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var userInput = ""
    var levelNumber: Int

    var body: some View {

        ZStack {
            if triviaManager.reachedEnd {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                            .yellowTitle()

                    Text("Congratulations, you completed the game!")

                    Text("You scored \(triviaManager.score) out of \(triviaManager.length)")

                    Button {
                        Task.init {
                            await triviaManager.fetchTrivia()
                        }
                    } label: {
                        PrimaryButton(text: "Play again")
                    }
                }
                        .foregroundColor(Color("AccentColor"))
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(.black))
                        .edgesIgnoringSafeArea(.all)
            } else {


                VStack {
                    Spacer()

                    Text("Level \(levelNumber)")
                            .yellowTitle()
                    Spacer()

                    ProgressBar(progress: triviaManager.progress)

                    VStack(alignment: .leading, spacing: 20) {
                        Text(triviaManager.question)
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(.gray)

                        if triviaManager.isMultipleChoice {
                            ForEach(triviaManager.answerChoices, id: \.id) { answer in
                                AnswerRow(answer: answer)
                                        .environmentObject(triviaManager)
                            }
                        } else {
                            HStack {
                                TextField("Enter your answer...", text: $userInput)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(8)
                                        .foregroundColor(.primary)

                                if let unit = triviaManager.currentUnit {
                                    Text(unit)
                                            .font(.system(size: 18))
                                            .bold()
                                            .foregroundColor(.gray)
                                }
                            }
                        }
                    }

                    Button {
                        if triviaManager.isMultipleChoice {
                            triviaManager.goToNextQuestion()
                        } else {
                            triviaManager.processFillInBlankAnswer(userInput)
                        }
                    } label: {
                        PrimaryButton(text: "Next", background: triviaManager.answerSelected || !userInput.isEmpty ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.0564, opacity: 0.327))
                    }
                            .disabled(triviaManager.isMultipleChoice ? !triviaManager.answerSelected : userInput.isEmpty)

                    Spacer()

                    Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                            .foregroundColor(Color("AccentColor"))
                            .fontWeight(.heavy)
                }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .background(Color.black)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(levelNumber: 1)
                .environmentObject(TriviaManager())
    }
}
