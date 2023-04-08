//
//  StudentProgressView.swift
//  questions
//
//  Created by niels rocholl on 08/04/2023.
//

import Foundation
import SwiftUI

struct StudentProgressView: View {
    @ObservedObject var triviaManager: TriviaManager
    
    private let studentName = "Niels Rocholl"
    
    var body: some View {
        VStack {
            Text(studentName)
                .font(.largeTitle)
                .padding(.bottom)
            
            ProgressCircleView(progress: averageScore(), passed: averageScore() > 0.5)
            
            VStack(alignment: .leading) {
                Text("Current score per level:")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center) // Center the text
                    .padding(.bottom)
                
                ForEach(triviaManager.levelScores.indices, id: \.self) { level in
                    HStack {
                        Image("level\(level + 1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)

                        Text("§\(level + 1) \(levelNames()[level]):")
                            .font(.body)

                        Spacer()

                        Text("\(triviaManager.levelScores[level] * 100, specifier: "%.0f")%")
                            .font(.body)
                            .bold()
                    }
                    .padding(.top, 5)
                    .padding(.horizontal)
                }

            }
                        

            
            HStack {
                VStack {
                    Text("Best Level")
                        .font(.title2)
                    Text("\(bestLevel())")
                        .font(.largeTitle)
                        .bold()
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .frame(minWidth: 0, maxWidth: .infinity) // Add this line

                VStack {
                    Text("Worst Level")
                        .font(.title2)
                    Text("\(hardestLevel())")
                        .font(.largeTitle)
                        .bold()
                }
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
                .frame(minWidth: 0, maxWidth: .infinity) // Add this line
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Student Progress")
    }
    
    func averageScore() -> CGFloat {
        let flattenedScores = triviaManager.levelScores.compactMap { $0 }
        let totalScore = flattenedScores.reduce(0, +)
        let average = totalScore / CGFloat(flattenedScores.count)
        return average
    }
    
    func bestLevel() -> Int {
        let index = triviaManager.levelScores.firstIndex(of: triviaManager.levelScores.max() ?? 0)
        return (index ?? 0) + 1
    }
    
    func hardestLevel() -> Int {
        let index = triviaManager.levelScores.firstIndex(of: triviaManager.levelScores.min() ?? 0)
        return (index ?? 0) + 1
    }
    
    func levelNames() -> [String] {
            return [
                "Numbers, quantities and units", // Level 1
                "Length", // Level 2
                "Weight", // Level 3
                "Time", // Level 4
                "Other measures and prefixes", // Level 5
                "Reference measures", // Level 6
                "Rules of thumb and formulas" // Level 7
            ]
        }
}

struct ProgressCircleView: View {
    var progress: CGFloat
    var passed: Bool

    @State private var animatedProgress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(passed ? .green : .red)

            Circle()
                .trim(from: 0.0, to: animatedProgress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(passed ? .green : .red)
                .rotationEffect(Angle(degrees: 270.0))
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                        withAnimation(.linear(duration: 0.05)) {
                            if animatedProgress < progress {
                                animatedProgress += 0.05
                            } else {
                                timer.invalidate()
                            }
                        }
                    }
                }

            Text("\(Int(animatedProgress * 100))%")
                .font(.largeTitle)
                .bold()
                .foregroundColor(passed ? .green : .red)
        }
        .frame(width: 150, height: 150)
        .padding()
    }
}

