//  ContentView.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import SwiftUI
import Combine


struct LevelView: View {
    @StateObject var cognitiveModel = CognitiveModel()

    var body: some View {


        NavigationView {

            VStack(spacing: 40) {

                VStack(spacing: 20) {


                    GeometryReader { geo in
                        ZStack {
                            
                            Image("Wallpapernew")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: geo.size.width, height:
                                        geo.size.height, alignment: .center)
                                .opacity(1.0)
                            
                            // More than 10 views gives error, we resolve this by creating sub groups
                            Group {
                                Group {
                                    LineView(startPoint: CGPoint(x: 180, y: 660), endPoint: CGPoint(x: 298, y: 580))
                                    LineView(startPoint: CGPoint(x: 300, y: 565), endPoint: CGPoint(x: 90, y: 495))
                                    LineView(startPoint: CGPoint(x: 318, y: 550), endPoint: CGPoint(x: 298, y: 390))
                                    LineView(startPoint: CGPoint(x: 80, y: 490), endPoint: CGPoint(x: 225, y: 220))
                                    LineView(startPoint: CGPoint(x: 65, y: 490), endPoint: CGPoint(x: 120, y: 330))
                                    LineView(startPoint: CGPoint(x: 310, y: 390), endPoint: CGPoint(x: 240, y: 220))
                                    LineView(startPoint: CGPoint(x: 125, y: 300), endPoint: CGPoint(x: 110, y: 50))
                                    LineView(startPoint: CGPoint(x: 220, y: 185), endPoint: CGPoint(x: 130, y: 43))
                                }
                                Group {
                                    ArrowheadView(position: CGPoint(x: 200, y: 532), rotation: 110)
                                    ArrowheadView(position: CGPoint(x: 309, y: 480), rotation: 173)
                                    ArrowheadView(position: CGPoint(x: 96, y: 400), rotation: 200)
                                    ArrowheadView(position: CGPoint(x: 166, y: 330), rotation: 205)
                                    ArrowheadView(position: CGPoint(x: 269, y: 290), rotation: 160)
                                    ArrowheadView(position: CGPoint(x: 230, y: 626), rotation: 240)
                                    ArrowheadView(position: CGPoint(x: 119, y: 200), rotation: 178)
                                    ArrowheadView(position: CGPoint(x: 178, y: 120), rotation: 150)
                                }
                            }
                            
                            Group {
                                LevelButton(levelNumber: 1, size: 55, imagePadding: 4, position: CGPoint(x: 160, y: 670))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 2, size: 55, imagePadding: 6, position: CGPoint(x: 320, y: 570))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 3, size: 55, imagePadding: 3, position: CGPoint(x: 70, y: 490))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 4, size: 55, imagePadding: 5, position: CGPoint(x: 300, y: 380))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 5, size: 55, imagePadding: 2, position: CGPoint(x: 125, y: 315))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 6, size: 55, imagePadding: 2, position: CGPoint(x: 230, y: 200))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 7, size: 55, imagePadding: 2, position: CGPoint(x: 110, y: 35))
                                    .environmentObject(cognitiveModel)
                            }

                        }
                    }
                    NavigationLink(destination: StudentProgressView(cognitiveModel: cognitiveModel)) {
                         Text("Your Progress")
                             .font(.headline)
                             .padding(.vertical, 8)
                             .padding(.horizontal, 12)
                             .background(RoundedRectangle(cornerRadius: 8).fill(Color.accentColor))
                             .foregroundColor(.white)
                             .padding(.horizontal)
                     }
                }
    
            }

        }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color(.black))
    }
}

 

struct LineView: View {
    let startPoint: CGPoint
    let endPoint: CGPoint
    
    var body: some View {
        Path { path in
            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
        .stroke(.black, lineWidth: 3)
    }
}

struct ArrowheadView: View {
    let position: CGPoint
    let rotation: Double
    
    var body: some View {
        Image(systemName: "arrowtriangle.down.fill")
            .font(.system(size: 20.0))
            .rotationEffect(.degrees(rotation), anchor: .center)
            .position(position)
    }
}
