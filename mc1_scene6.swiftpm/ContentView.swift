import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                GeometryReader { _ in
                    VideoView(videoNames: ["video", "video2"])
                }
            }
            
            TapeButtonImageView()
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
