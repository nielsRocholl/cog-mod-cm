import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State private var userInput = ""
    @State private var isFillInBlankAnswerCorrect: Bool? = nil
    @State private var isFillInBlankAnswerSubmitted: Bool = false


    var levelNumber: Int


    var body: some View {

        ZStack {
            if triviaManager.reachedEnd {
                VStack(spacing: 20) {
                    Text("Level \(levelNumber)")
                            .yellowTitle()

                    Text("Congratulations, you completed level \(levelNumber)")

                    Text("You scored \(triviaManager.levelIndividualScores[levelNumber]) out of \(triviaManager.length)")

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

                    ProgressBar(progress: triviaManager.progress, width: 350, height: 4)


                    VStack(alignment: .leading, spacing: 20) {
                        // Display the image if it's not "None"
                        if let imageName = triviaManager.currentImage, imageName != "None" {
                            Group {
                                Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 10)
                                        .frame(maxWidth: .infinity) // Center the image
                                        .padding(.bottom, 20)
                            }
                        }

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

                                if let isCorrect = isFillInBlankAnswerCorrect {
                                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                            .foregroundColor(isCorrect ? .green : .red)
                                }

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
                            if isFillInBlankAnswerSubmitted {
                                isFillInBlankAnswerCorrect = nil
                                isFillInBlankAnswerSubmitted = false
                                userInput = ""
                                triviaManager.goToNextQuestion()
                            } else {
                                isFillInBlankAnswerCorrect = triviaManager.processFillInBlankAnswer(userInput)
                                isFillInBlankAnswerSubmitted = true
                            }
                        }
                    } label: {
                        PrimaryButton(text: (triviaManager.isMultipleChoice || isFillInBlankAnswerSubmitted) ? "Next" : "Submit", background: triviaManager.answerSelected || !userInput.isEmpty ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.0564, opacity: 0.327))
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
                .onAppear {
                    triviaManager.currentLevel = levelNumber
                }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(levelNumber: 1)
                .environmentObject(TriviaManager())
    }
}
