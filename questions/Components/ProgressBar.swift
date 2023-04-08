import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat // progress of the progress bar
    var width: CGFloat // width of the progress bar
    var height: CGFloat // height of the progress bar
    var isYellowOnly: Bool // color of the progress bar

    init(progress: CGFloat, width: CGFloat, height: CGFloat, isYellowOnly: Bool = false) {
        self.progress = progress
        self.width = width
        self.height = height
        self.isYellowOnly = isYellowOnly
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                    .frame(maxWidth: width, maxHeight: height)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.500, opacity: 0.800))
                    .cornerRadius(10)

            Rectangle()
                    .frame(width: progress * width, height: height)
                    .foregroundColor(progressColor(for: progress))
                    .cornerRadius(10)
        }
    }

    func progressColor(for progress: CGFloat) -> Color {
        if isYellowOnly {
            return .yellow
        } else {
            if progress < 1 / 3 {
                return .red
            } else if
                    progress < 2 / 3 {
                return .yellow
            } else {
                return .green
            }
        }
    }
}
