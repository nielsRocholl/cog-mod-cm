//
//  ContentView.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import SwiftUI

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

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "1")
                                    .position(x: 160, y: 670)
                            }

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "2")
                                    .position(x: 320, y: 570)
                            }

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "3")
                            }
                                .position(x: 70, y: 490)

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "4")
                                    .position(x: 300, y: 380)
                            }

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "5")
                                    .position(x: 125, y: 315)
                            }

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
                                PrimaryButton(text: "6")
                                    .position(x: 230, y: 200)
                            }

                            NavigationLink {
                                TriviaView()
                                    .environmentObject(triviaManager)
                            } label: {
//                                 Image(systemName: "minus.circle")
                                PrimaryButton(text: "7")
                                    .position(x: 110, y: 35)
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
