//  ContentView.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//
import SwiftUI
import Combine



struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(spacing: 40) {
   
                VStack(spacing: 20) {
                    
                    
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
                            
                            // I put this here to group some of the arguments in the "NavigationView" struct. Apparently only 10 views max are allowed in SwiftUI and I was getting an error
                            Group {
                                
                                // Line from level 1 to 2
                                Path { path in
                                    path.move(to: CGPoint(x: 180, y: 660)) // from
                                    path.addLine(to: CGPoint(x: 298, y: 580)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 2 to 3
                                Path { path in
                                    path.move(to: CGPoint(x: 300, y: 565)) // from
                                    path.addLine(to: CGPoint(x: 90, y: 495)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 2 to 4
                                Path { path in
                                    path.move(to: CGPoint(x: 318, y: 550)) // from
                                    path.addLine(to: CGPoint(x: 298, y: 390)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 3 to 6
                                Path { path in
                                    path.move(to: CGPoint(x: 80, y: 490)) // from
                                    path.addLine(to: CGPoint(x: 225, y: 220)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 3 to 5
                                Path { path in
                                    path.move(to: CGPoint(x: 65, y: 490)) // from
                                    path.addLine(to: CGPoint(x: 120, y: 330)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 4 to 6
                                Path { path in
                                    path.move(to: CGPoint(x: 310, y: 390)) // from
                                    path.addLine(to: CGPoint(x: 240, y: 220)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 5 to 7
                                Path { path in
                                    path.move(to: CGPoint(x: 125, y: 300)) // from
                                    path.addLine(to: CGPoint(x: 110, y: 50)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Line from level 6 to 7
                                Path { path in
                                    path.move(to: CGPoint(x: 220, y: 185)) // from
                                    path.addLine(to: CGPoint(x: 130, y: 43)) // to
                                }
                                .stroke(.black, lineWidth: 3)
                                
                                // Add here the other arrow heads but careful because the code breaks
                                ZStack {
                                    // Arrowhead 2 to 3
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(110), anchor: .center)
                                        .position(x: 200, y: 532)
                                    
                                    // Arrowhead 2 to 4
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(173), anchor: .center)
                                        .position(x: 309, y: 480)
                                    
                                    // Arrowhead 3 to 5
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(200), anchor: .center)
                                        .position(x: 96, y: 400)
                                    
                                    // Arrowhead 3 to 6
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(205), anchor: .center)
                                        .position(x: 166, y: 330)
                                    
                                    // Arrowhead 4 to 6
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(160), anchor: .center)
                                        .position(x: 269, y: 290)
                                    
                                    // Arrowhead 1 to 2
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(240), anchor: .center)
                                        .position(x: 230, y: 626)
                                    
                                    // Arrowhead 5 to 7
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(178), anchor: .center)
                                        .position(x: 119, y: 200)
                                    
                                    // Arrowhead 6 to 7
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.system(size: 20.0))
                                        .rotationEffect(.degrees(150), anchor: .center)
                                        .position(x: 178, y: 120)
                                }
                                
                                
                            }
                            

                            Group {
                                NavigationLink(destination: QuestionView(levelNumber: 1).environmentObject(triviaManager).onAppear {
                                    triviaManager.prepareForLevel(1)
                                }, label: {
                                    VStack {
                                        PrimaryButton(text: "1")
                                        ProgressBar(progress: triviaManager.levelScores[0], width: 70, height: 8)
                                    }
                                    .position(x: 160, y: 670)
                                }).buttonStyle(PlainButtonStyle()).onAppear {
                                    triviaManager.prepareForLevel(1)
                                }

                                NavigationLink(destination: QuestionView(levelNumber: 2).environmentObject(triviaManager).onAppear {
                                    triviaManager.prepareForLevel(2)
                                }, label: {
                                    VStack {
                                        PrimaryButton(text: "2")
                                        ProgressBar(progress: triviaManager.levelScores[1], width: 70, height: 8)
                                    }
                                    .position(x: 320, y: 570)
                                }).buttonStyle(PlainButtonStyle())

                                NavigationLink(destination: QuestionView(levelNumber: 3).onAppear {
                                    triviaManager.prepareForLevel(3)
                                }.environmentObject(triviaManager), label: {
                                    VStack {
                                        PrimaryButton(text: "3")
                                        ProgressBar(progress: triviaManager.levelScores[2], width: 70, height: 8)
                                    }
                                    .position(x: 70, y: 490)
                                }).buttonStyle(PlainButtonStyle()).onAppear {
                                    triviaManager.prepareForLevel(3)
                                }
                                
                                NavigationLink(destination: QuestionView(levelNumber: 4).onAppear {
                                    triviaManager.prepareForLevel(4)
                                }.environmentObject(triviaManager), label: {
                                    VStack {
                                        PrimaryButton(text: "4")
                                        ProgressBar(progress: triviaManager.levelScores[3], width: 70, height: 8)
                                    }
                                    .position(x: 300, y: 380)
                                }).buttonStyle(PlainButtonStyle())

                                NavigationLink(destination: QuestionView(levelNumber: 5).onAppear {
                                    triviaManager.prepareForLevel(5)
                                }.environmentObject(triviaManager), label: {
                                    VStack {
                                        PrimaryButton(text: "5")
                                        ProgressBar(progress: triviaManager.levelScores[4], width: 70, height: 8)
                                    }
                                    .position(x: 125, y: 315)
                                }).buttonStyle(PlainButtonStyle()).onAppear {
                                    triviaManager.prepareForLevel(5)
                                }

                                NavigationLink(destination: QuestionView(levelNumber: 6).onAppear {
                                    triviaManager.prepareForLevel(6)
                                }.environmentObject(triviaManager), label: {
                                    VStack {
                                        PrimaryButton(text: "6")
                                        ProgressBar(progress: triviaManager.levelScores[5], width: 70, height: 8)
                                    }
                                    .position(x: 230, y: 200)
                                }).buttonStyle(PlainButtonStyle())
                                
                                NavigationLink(destination: QuestionView(levelNumber: 7).onAppear {
                                    triviaManager.prepareForLevel(7)
                                }.environmentObject(triviaManager), label: {
                                    VStack {
                                        PrimaryButton(text: "7")
                                        ProgressBar(progress: triviaManager.levelScores[6], width: 70, height: 8)
                                    }
                                    .position(x: 110, y: 35)
                                }).buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(.black))
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
