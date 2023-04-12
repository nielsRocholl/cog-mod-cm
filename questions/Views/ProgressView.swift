//
//  StudentProgressView.swift
//  questions
//
//  Created by niels rocholl on 08/04/2023.
//

import Foundation
import SwiftUI

struct ProgressView: View {
    @ObservedObject var cognitiveModel: CognitiveModel
    
    private let studentName = "Niels Rocholl"
    
    var body: some View {
        VStack {
            Text(studentName)
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(Color("AccentColor"))

            
            ProgressCircle(progress: averageScore(), passed: averageScore() > 0.5)
            
            VStack(alignment: .leading) {
                Text("Current score per level:")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center) // Center the text
                    .padding(.bottom)
                
                ForEach(cognitiveModel.levelScores.indices, id: \.self) { level in
                    HStack {
                        Image("level\(level + 1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)

                        Text("§\(level + 1) \(levelNames()[level]):")
                            .font(.body)

                        Spacer()

                        SmallProgressCircle(progress: CGFloat(cognitiveModel.levelScores[level]), passed: cognitiveModel.levelScores[level] > 0.5)
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
                .background(Color.green.opacity(0.5))
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
                .background(Color.red.opacity(0.5))
                .cornerRadius(10)
                .frame(minWidth: 0, maxWidth: .infinity) // Add this line
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Student Progress")
        .background(Color("AccentColor3")) // Change the background color
        .foregroundColor(.black) // Change the foreground color
    }
    
    func averageScore() -> CGFloat {
        let flattenedScores = cognitiveModel.levelScores.compactMap { $0 }
        let totalScore = flattenedScores.reduce(0, +)
        let average = totalScore / CGFloat(flattenedScores.count)
        return average
    }
    
    func bestLevel() -> Int {
        let index = cognitiveModel.levelScores.firstIndex(of: cognitiveModel.levelScores.max() ?? 0)
        return (index ?? 0) + 1
    }
    
    func hardestLevel() -> Int {
        let index = cognitiveModel.levelScores.firstIndex(of: cognitiveModel.levelScores.min() ?? 0)
        return (index ?? 0) + 1
    }
    
    func levelNames() -> [String] {
            return [
                "Units of measurement", // Level 1
                "Basic arithmetic", // Level 2
                "Word problems", // Level 3
                "Large number arithmetic", // Level 4
                "Multi-step word problems", // Level 5
                "Large number word problems", // Level 6
                "Final test" // Level 7
            ]
        }
}

struct ProgressCircle: View {
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

struct SmallProgressCircle: View {
    var progress: CGFloat
    var passed: Bool

    @State private var animatedProgress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .opacity(0.3)
                .foregroundColor(passed ? .green : .red)

            Circle()
                .trim(from: 0.0, to: animatedProgress)
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
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
                .font(.system(size: 7))
                .bold()
                .foregroundColor(passed ? .green : .red)
        }
        .frame(width: 25, height: 25)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
    }
}
