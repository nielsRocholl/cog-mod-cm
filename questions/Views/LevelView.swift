//  ContentView.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import SwiftUI
import Combine


struct LevelView: View {
    @StateObject var cognitiveModel = CognitiveModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {


        NavigationView {

            VStack(spacing: 20) {

                VStack(spacing: 0) {


                    GeometryReader { geo in
                        ZStack {
                            
                            Image("Wallpaper")
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
                                    // Node 1-2
                                    Line(startPoint: CGPoint(x: 187, y: 619), endPoint: CGPoint(x: 297, y: 575))
                                    // Node 2-3
                                    Line(startPoint: CGPoint(x: 296, y: 550), endPoint: CGPoint(x: 93, y: 455))
                                    // Node 2-4
                                    Line(startPoint: CGPoint(x: 318, y: 535), endPoint: CGPoint(x: 275, y: 359))
                                    // Node 3-6
                                    Line(startPoint: CGPoint(x: 88, y: 422), endPoint: CGPoint(x: 215, y: 179))
                                    // Node 3-5
                                    Line(startPoint: CGPoint(x: 70, y: 415), endPoint: CGPoint(x: 92, y: 318))
                                    // Node 4-6
                                    Line(startPoint: CGPoint(x: 265, y: 305), endPoint: CGPoint(x: 240, y: 182))
                                    // Node 5-7
                                    Line(startPoint: CGPoint(x: 100, y: 265), endPoint: CGPoint(x: 103, y: 60))
                                    // Node 6-7
                                    Line(startPoint: CGPoint(x: 216, y: 135), endPoint: CGPoint(x: 125, y: 48))
                                }
                                Group {
                                    // 2-3
                                    Arrowhead(position: CGPoint(x: 200, y: 505), rotation: 116)
                                    // 2-4
                                    Arrowhead(position: CGPoint(x: 295, y: 440), rotation: 166)
                                    // 3-5
                                    Arrowhead(position: CGPoint(x: 80, y: 370), rotation: 193)
                                    // 3-6
                                    Arrowhead(position: CGPoint(x: 149, y: 305), rotation: 207)
                                    // 4-6
                                    Arrowhead(position: CGPoint(x: 253, y: 245), rotation: 167)
                                    // 1-2
                                    Arrowhead(position: CGPoint(x: 248, y: 594), rotation: 246)
                                    // 5-7
                                    Arrowhead(position: CGPoint(x: 101, y: 150), rotation: 181)
                                    // 6-7
                                    Arrowhead(position: CGPoint(x: 169, y: 90), rotation: 136)
                                }
                            }
                            
                            Group {
                                LevelButton(levelNumber: 1, size: 55, imagePadding: 4, position: CGPoint(x: 160, y: 630))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 2, size: 55, imagePadding: 6, position: CGPoint(x: 320, y: 570))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 3, size: 55, imagePadding: 3, position: CGPoint(x: 70, y: 450))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 4, size: 55, imagePadding: 5, position: CGPoint(x: 268, y: 340))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 5, size: 55, imagePadding: 2, position: CGPoint(x: 100, y: 300))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 6, size: 55, imagePadding: 2, position: CGPoint(x: 230, y: 165))
                                    .environmentObject(cognitiveModel)
                                
                                LevelButton(levelNumber: 7, size: 55, imagePadding: 2, position: CGPoint(x: 103, y: 40))
                                    .environmentObject(cognitiveModel)
                            }

                        }
                    }
                    NavigationLink(destination: ProgressView(cognitiveModel: cognitiveModel)) {
                         Text("My Progress")
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

 

struct Line: View {
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

struct Arrowhead: View {
    let position: CGPoint
    let rotation: Double
    
    var body: some View {
        Image(systemName: "arrowtriangle.down.fill")
            .font(.system(size: 20.0))
            .rotationEffect(.degrees(rotation), anchor: .center)
            .position(position)
    }
}
