//
//  AnswerRow.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: CognitiveModel
    var answer: Answer
    @State private var isSelected = false


    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)

    var red = Color(red: 0.71, green: 0.094, blue: 0.1)

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "circle.fill")
                    .font(.caption)

            Text(answer.text)
                    //                .bold()
                    .font(.system(size: 18)) // Smaller font size


            if isSelected {
                Spacer()

                Image(systemName: answer.isCorrect ?
                        "checkmark.circle.fill" :
                        "x.circle.fill")
                        .foregroundColor(answer.isCorrect ?
                                green : red)
            }

        }
                //        .padding(.vertical, 8) // Reduced vertical padding
                //        .padding(.horizontal, 12) // Reduced horizontal padding
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
                .background(.white)
                .cornerRadius(10)
                .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
                .onTapGesture {
                    if !triviaManager.answerSelected {
                        isSelected = true
                        triviaManager.processMPCAnswer(answer: answer)
                    }
                }
    }
}


struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Someone", isCorrect: false))
                .environmentObject(CognitiveModel())
    }
}

