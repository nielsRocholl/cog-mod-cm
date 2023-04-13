//
//  primaryButton.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")

    var body: some View {
        Text(text)
                .frame(width: 15, height: 15)
                .foregroundColor(.white)
                .padding()
                .background(background)
                .cornerRadius(30)
                .shadow(radius: 10)
    }
}
