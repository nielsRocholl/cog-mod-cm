import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var cognitiveModel: CognitiveModel
    @State private var userInput = ""
    @State private var isFillInBlankAnswerCorrect: Bool? = nil
    @State private var isFillInBlankAnswerSubmitted: Bool = false
    
    var levelNumber: Int
    @State private var isHintVisible: Bool = false

    
    var body: some View {
        ZStack {
            if cognitiveModel.reachedEnd[levelNumber - 1] {
                VStack(spacing: 20) {
                    Text("Level \(levelNumber)")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                    
                    if cognitiveModel.levelIndividualScores[levelNumber - 1] == cognitiveModel.length {
                        Text("Congratulations, you have mastered level \(levelNumber)!")
                    } else {
                        Text("You have asnswered all questions, but some answeres where incorrect.")
                    }
                    
                    Text("You scored \(cognitiveModel.levelIndividualScores[levelNumber - 1]) out of \(cognitiveModel.length)")
                    
                    if cognitiveModel.levelIndividualScores[levelNumber - 1] != cognitiveModel.length {
                        Button {
                            Task.init {
                                cognitiveModel.prepareForLevel(levelNumber)
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
                        if let imageName = cognitiveModel.currentImage, imageName != "None" {
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
                        
                        ProgressBar(progress: cognitiveModel.progress, width: 350, height: 4, isYellowOnly: true)
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
                        Text(cognitiveModel.hint)
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
                        
                        Text(cognitiveModel.question)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)


                        if cognitiveModel.isMultipleChoice {
                            ForEach(cognitiveModel.answerChoices, id: \.id) { answer in
                                AnswerRow(answer: answer)
                                    .environmentObject(cognitiveModel)
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
                                
                                if let unit                             = cognitiveModel.currentUnit {
                                    Text(unit)
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                    }
                    
                    Button {
                        isHintVisible = false
                        if cognitiveModel.isMultipleChoice {
                            cognitiveModel.goToNextQuestion()
                        } else {
                            if isFillInBlankAnswerSubmitted {
                                isFillInBlankAnswerCorrect = nil
                                isFillInBlankAnswerSubmitted = false
                                userInput = ""
                                cognitiveModel.goToNextQuestion()
                            } else {
                                isFillInBlankAnswerCorrect = cognitiveModel.processFillInBlankAnswer(userInput)
                                isFillInBlankAnswerSubmitted = true
                            }
                        }
                    } label: {
                        Text((cognitiveModel.isMultipleChoice || isFillInBlankAnswerSubmitted) ? "Next" : "Submit")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(cognitiveModel.answerSelected || !userInput.isEmpty ? .white : .gray)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(RoundedRectangle(cornerRadius: 12).fill(cognitiveModel.answerSelected || !userInput.isEmpty ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.0564, opacity: 0.327)))
                    }
                    .disabled(cognitiveModel.isMultipleChoice ? !cognitiveModel.answerSelected : userInput.isEmpty)
                    .padding(.top, 20)



                    
                    Spacer()
                    
                    Text("\(cognitiveModel.index + 1) out of \(cognitiveModel.length)")
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
            cognitiveModel.currentLevel = levelNumber
        }
    }
}
