import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                GeometryReader { _ in
                    VideoView(videoNames: ["video", "video2"])
                }
            }
            ZStack {
                Color.green
                    .frame(width: 200)
                Text("대충 카세트 버튼")
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
