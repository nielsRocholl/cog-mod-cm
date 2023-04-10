import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: CognitiveModel
    @State private var userInput = ""
    @State private var isFillInBlankAnswerCorrect: Bool? = nil
    @State private var isFillInBlankAnswerSubmitted: Bool = false
    
    var levelNumber: Int
    @State private var isHintVisible: Bool = false

    
    var body: some View {
        ZStack {
            if triviaManager.reachedEnd[levelNumber - 1] {
                VStack(spacing: 20) {
                    Text("Level \(levelNumber)")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                    
                    if triviaManager.levelIndividualScores[levelNumber - 1] == triviaManager.length {
                        Text("Congratulations, you have mastered level \(levelNumber)!")
                    } else {
                        Text("Congratulations, you completed level \(levelNumber)")
                    }
                    
                    Text("You scored \(triviaManager.levelIndividualScores[levelNumber - 1]) out of \(triviaManager.length)")
                    
                    if triviaManager.levelIndividualScores[levelNumber - 1] != triviaManager.length {
                        Button {
                            Task.init {
                                triviaManager.prepareForLevel(levelNumber)
                            }
                        } label: {
                            PrimaryButton(text: "Play again")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("AccentColor3"))
                .edgesIgnoringSafeArea(.all)
            } else {
                VStack {
                    Spacer()
                    
                    Text("Level \(levelNumber)")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                    
                    Spacer()
                    
                    VStack {
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
                        
                        ProgressBar(progress: triviaManager.progress, width: 350, height: 4, isYellowOnly: true)
                    }
                    
                    Button(action: {
                        isHintVisible.toggle()
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(Color("AccentColor"))
                    }
                    .padding(.bottom, 8)
                    .padding(.top, 8)
                    
                    if isHintVisible {
                        Text(triviaManager.hint)
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                                    .padding(.bottom, 20)
                                }
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Display the image if it's not "None"
//                        if let imageName = triviaManager.currentImage, imageName != "None" {
//                            Group {
//                                Image(imageName)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 200, height: 200)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 4))
//                                    .shadow(radius: 10)
//                                    .frame(maxWidth: .infinity) // Center the image
//                                    .padding(.bottom, 20)
//                            }
//                        }
                        
                        Text(triviaManager.question)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)

                        if triviaManager.isMultipleChoice {
                            ForEach(triviaManager.answerChoices, id: \.id) { answer in
                                AnswerRow(answer: answer)
                                    .environmentObject(triviaManager)
                            }
                        } else {
                            HStack {
                                TextField("Enter your answer...", text: $userInput)
                                    .padding()
                                    .background(Color("AccentColor3"))
                                    .cornerRadius(8)
                                    .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                                    .foregroundColor(.black)
                                
                                if let isCorrect = isFillInBlankAnswerCorrect {
                                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                        .foregroundColor(isCorrect ? .green : .red)
                                }
                                
                                if let unit                             = triviaManager.currentUnit {
                                    Text(unit)
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(.black)
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
                        Text((triviaManager.isMultipleChoice || isFillInBlankAnswerSubmitted) ? "Next" : "Submit")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(triviaManager.answerSelected || !userInput.isEmpty ? .white : .gray)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(RoundedRectangle(cornerRadius: 12).fill(triviaManager.answerSelected || !userInput.isEmpty ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.0564, opacity: 0.327)))
                    }
                    .disabled(triviaManager.isMultipleChoice ? !triviaManager.answerSelected : userInput.isEmpty)
                    .padding(.top, 20)



                    
                    Spacer()
                    
                    Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color("AccentColor3"))
            }
        }
        .onAppear {
            triviaManager.currentLevel = levelNumber
        }
    }
}
