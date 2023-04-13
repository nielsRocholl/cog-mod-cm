//
//  Extensions.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import Foundation
import SwiftUI

extension Text {
    func yellowTitle() -> some View {
        self.font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
    }
}
