//
//  textField.swift
//  questions
//
//  Created by C. Kyriakides on 14/03/2023.
//

// Upon clicking "save", the answer is stored in the "dataArray" array

import SwiftUI

struct TextfieldBootcamp: View {

    @State var textFieldText: String = ""
    @State var dataArray: [String] = []

    var body: some View {

        HStack {
            TextField("Required", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(5))
                    .foregroundColor(.white) // letters color
                    .font(.headline)
                    .frame(width: 50)
//                    .position(x: 50, y: 300)

            Button(action: {
                if isTextAppropriate() {
                    saveText()
                }
            }, label: {
                Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isTextAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 80)
//                        .position(x: -80, y: 300)
            })
                    .disabled(!isTextAppropriate())

            ForEach(dataArray, id: \.self) { data in
                // this creates an id for each item in the data
                Text(data)
            }
        }


    }

    // Boolean function that checks if the answer is valid. Currently it only checks if the number of characters is at least 3, otherwise the answer is not valid
    func isTextAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }

    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }

}

struct TextfieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldBootcamp()
    }
}
