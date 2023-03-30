import SwiftUI
import Combine

struct Scene4View: View {
    @Binding var sceneNum: Int

    @State private var draggedOffset = CGSize.zero
    @State private var accumulatedOffset = CGSize.zero
    
    @State var scale:CGFloat = 1.0
    @State var image = "background"
    @State var circleOpacity = 0.0
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                draggedOffset = accumulatedOffset + gesture.translation
            }
            .onEnded { gesture in
                accumulatedOffset = accumulatedOffset + gesture.translation
            }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                
                Image(image).resizable()
                ZStack {
                    Color.black.opacity(1.0)
                    ScaledToFitImage(fileName: "Frame_left")
                    ZStack {
                        Group {
                            ZStack {
                                Circle()
                                    .frame(width: 110, height: 110)
                                    .blendMode(.destinationOut)
                                    .opacity(0.8)
                                Circle()
                                    .frame(width: 90, height: 90)
                                    .blendMode(.destinationOut)
                                    .opacity(1)
                            }
                        }.scaleEffect(scale).offset(draggedOffset).gesture(simpleDrag).opacity(circleOpacity)
                    }
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                circleOpacity = 1.0
                            }
                        }
                    }
                    
                    Group {
                        Button(action: {
                            print("tapped!")
                            withAnimation(.easeInOut(duration: 2.0)){
                                scale = 30.0
                            }
                            // 지금으로부터 n초 뒤, 화면 전환
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                // Change the value
                                sceneNum = 5
                            }
                        }, label: {
                            Text("")
                                .frame(width: 80, height: 80)
                                .background(Color.clear)
                                .padding()
                        })
                    }.offset(x: 150, y: -350)
                }
                .compositingGroup()
                
            }
            ScaledToFitImage(fileName: "Frame_right_4Click")
        }.ignoresSafeArea()
    }
}

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}