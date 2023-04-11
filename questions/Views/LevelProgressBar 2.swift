struct CustomProgressView: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemGray5))

                Rectangle()
                    .frame(width: geometry.size.width * progress, height: geometry.size.height)
                    .foregroundColor(Color(.systemBlue))
            }
        }.cornerRadius(45.0)
    }
}
