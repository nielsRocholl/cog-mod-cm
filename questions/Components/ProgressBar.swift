import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var width: CGFloat
    var height: CGFloat // Add a height parameter
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: width, maxHeight: height)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress * width, height: height)
                .foregroundColor(progressColor(for: progress))
                .cornerRadius(10)
        }
    }
    
    func progressColor(for progress: CGFloat) -> Color {
        if progress < 1/3 {
            return .red
        } else if progress < 2/3 {
            return .yellow
        } else {
            return .green
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.5, width: 350, height: 4)
    }
}
