//
//  LevelButton.swift
//  questions
//
//  Created by niels rocholl on 09/04/2023.
//

import Foundation
import SwiftUI

struct LevelButton: View {
    var levelNumber: Int
    var size: CGFloat
    var imagePadding: CGFloat
    var position: CGPoint

    @EnvironmentObject var cognitiveModel: CognitiveModel

    var body: some View {
            if cognitiveModel.unlockedLevels[levelNumber - 1] {
                NavigationLink(destination: QuestionView(levelNumber: levelNumber).onAppear {
                    cognitiveModel.prepareForLevel(levelNumber)
                }.environmentObject(cognitiveModel), label: {
                    VStack {
                        ImageButton(imageName: "level\(levelNumber)", size: size, imagePadding: imagePadding)
                        ProgressBar(progress: cognitiveModel.levelScores[levelNumber - 1], width: 70, height: 8, isYellowOnly: false)
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .position(position)
            } else {
                VStack {
                    ImageButton(imageName: "level\(levelNumber)", size: size, imagePadding: imagePadding)
                    ProgressBar(progress: cognitiveModel.levelScores[levelNumber - 1], width: 70, height: 8, isYellowOnly: false)
                }
                .position(position)
                .opacity(0.5)
                .disabled(true)
            }
    }
}
