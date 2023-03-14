//
//  Answer.swift
//  questions
//
//  Created by C. Kyriakides on 08/03/2023.
//

import Foundation
// identifiable protocol means that each answer can be uniquely identified by its id.
// So for each answer we create we will create a random unique id
struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
