import SwiftUI


struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showInstructions = false

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
                }
                        .simultaneousGesture(TapGesture().onEnded {
                            self.presentationMode.wrappedValue.dismiss()
                        })

                Button(action: {
                    self.showInstructions = true
                }) {
                    Text("Instructions")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.gray))
                            .opacity(0.9)
                }
                        .sheet(isPresented: $showInstructions) {
                            InstructionsView()
                        }

                Spacer()
            }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("AccentColor3"))
                    .edgesIgnoringSafeArea(.all)
        }
    }
}

struct InstructionsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Spacer()

            Text("Instructions:")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Color("AccentColor"))
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "play.fill")
                    Text("By pressing the 'start' button you will navigate to the main screen.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "questionmark.square.fill")
                    Text("In the main screen, you will find a total of 7 question categories.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "lock.fill")
                    Text("Depending on how your score in the assessment test, some categories will be unlocked and some will be locked.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "arrow.up")
                    Text("These categories are represented as nodes in a valley. You start from the low nodes and as you learn new skills you progress to upper nodes requiring you to use and learn new skills.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "list.number")
                    Text("For each node there is a number of questions you have to complete in order to proceed to the next level.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "pencil.and.outline")
                    Text("Some questions are in multiple-choice format and some require you to fill-in the blanks.")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "star.fill")
                    Text("The more you practice and improve your scores, the more question categories you will unlock!")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "lightbulb.fill")
                    Text("Remember that if you get stuck, you can always click on the question mark to get a hint!")
                            .font(.system(size: 12))
                }
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "chart.bar.fill")
                    Text("Click on 'My Progress' to find details about your performance.")
                            .font(.system(size: 12))
                }
            }
                    .padding(.leading, 20)

            Spacer()

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.gray))
                        .opacity(0.9)
            }
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
        }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("AccentColor3"))
                .edgesIgnoringSafeArea(.all)
    }
}
