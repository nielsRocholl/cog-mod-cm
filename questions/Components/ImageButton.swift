//
//  ImageButton.swift
//  questions
//
//  Created by niels rocholl on 08/04/2023.
//

import Foundation
import SwiftUI

struct ImageButton: View {
    var imageName: String
    var size: CGFloat
    var background: Color = Color("AccentColor")
    var imagePadding: CGFloat = 0

    var body: some View {
        ZStack {
            Circle()
                    .fill(background)
                    .frame(width: size, height: size)

            Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(imagePadding)
                    .frame(width: size - 2 * imagePadding, height: size - 2 * imagePadding)
        }
                .clipShape(Circle())
                .shadow(radius: 3)
    }
}
