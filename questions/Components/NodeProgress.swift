import SwiftUI

struct NodeProgress: View {
    var progress: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: 4)

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: CGFloat(self.progress) * geometry.size.width, height: 4)
            }
        }.frame(height: 4)
    }
}
