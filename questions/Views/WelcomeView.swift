//
//  WelcomeView.swift
//  questions
//
//  Created by niels rocholl on 10/04/2023.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome to Arithmo")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                Spacer()
                
                Text("Get ready to test your knowledge and improve your math skills!")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                NavigationLink(destination: LevelView()) {
                    Text("Start")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color("AccentColor")))
                }.simultaneousGesture(TapGesture().onEnded {
                    self.presentationMode.wrappedValue.dismiss()
                })
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor3"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}
