import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var levelNumber: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Level \(levelNumber)")
                .yellowTitle()
            Spacer()
            
            ProgressBar(progress: triviaManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                // Adds a text field button
//                TextfieldBootcamp()
                
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.0564, opacity: 0.327))
            }
            .disabled(!triviaManager.answerSelected)
            
            Spacer()
            
            Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                .foregroundColor(Color("AccentColor"))
                .fontWeight(.heavy)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(levelNumber: 1)
            .environmentObject(TriviaManager())
    }
}
