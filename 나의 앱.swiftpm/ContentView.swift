import SwiftUI
import PlaygroundSupport
import AVFoundation


//-----------------------------------------
//-----------------------------------------

//let speechSynthesizer = AVSpeechSynthesizer()
//let utterance: AVSpeechUtterance = {
//    let utterance = AVSpeechUtterance(string: "우  르  릉  쾅 쾅 ㅋㅋㅋㅋ")
//    
//    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//    utterance.rate = 0.5
//    
//    return utterance
//}()


//-----------------------------------------
//-----------------------------------------

struct FloatingWordView: View {
    @State private var offsetY: CGFloat = 000
    @State private var offsetX: CGFloat = -200
    
    @State private var thunder: Bool = false

    
    @State private var XX: Bool = false  
    @State private var YY: Bool = false    
    
    @State private var opacity: Double = 1.0
    @State private var blueColor: Color = Color.blue
    @State private var blurRad: CGFloat = 1.0
    @State private var isAnimating = false
    @State private var effectScale = 1.0
    @State private var isCrumple = 360
    @State private var shouldAnimate = false
    
    private let animation2 = Animation.easeInOut(duration: 0.5).repeatCount(3, autoreverses: true)
    private let animation = Animation.easeOut(duration: 2)


    let word: String
    
    var body: some View {
        ZStack{
            if(thunder){
                ThunderView()
            }
            Text(word)
                .blur(radius: blurRad)
                .opacity(opacity)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(30)
                .background(Circle().fill(blueColor).opacity(0.3))
                .scaleEffect(effectScale)
            
                .offset(x: offsetX, y: offsetY)
            
                .onAppear{
                    withAnimation(.easeOut(duration: 1.5)) { 
                        offsetY = -200
                        offsetX = 200
                    }
                    withAnimation(.easeOut(duration: 2).delay(1.5)) { 
                        offsetY = -400
                        offsetX = -200
                    }
                    withAnimation(.easeOut(duration: 2).delay(3.5)) { 
                        offsetY = -600
                        offsetX = 200
                    }
                    withAnimation(.easeOut(duration: 2).delay(5.5)) { 
                        offsetY = -800
                        offsetX = 0
                    }
                }
            
                .gesture(
                    TapGesture()
                        .onEnded({ 
//                            speechSynthesizer.speak(utterance)
                            withAnimation(.linear(duration: 4.5)) {
                                thunder = true
                            }
                            withAnimation(.easeOut(duration: 0.5).delay(1.5)) {
                                thunder = false
                            }
                        })
                        .onEnded {
                            withAnimation(.easeOut(duration: 0.5)) {
                                blurRad = 3.0
                                effectScale = 1.5
                            }
                            withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
                                opacity = 0
                                blueColor = Color.white
                                effectScale = 3.0
                            }
                        }
                    
                )
            
        }
    }
}

struct FloatingWordsView: View {
    let words = ["아이디어1", "아이디어2", "아이디어3", "아이디어4", "아이디어5"]

    var body: some View {
        HStack {
            ForEach(words.indices, id: \.self) { index in
                FloatingWordView(word: words[index])
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()
//                    .rotationEffect(Angle(degrees: Double(index) * 360.0 / Double(words.count)))
            }
        }
    }
}


struct ThunderView: View {
    @State private var isAnimating = false
    
    var body: some View {
        Canvas { context, size in
            let x = size.width
            let y = size.height
        
            
            var path = Path()
            path.move(to: CGPoint(x: x*0.5, y: y*0.8))
            path.addLine(to: CGPoint(x: x*0.7, y:y*0.55))
            path.addLine(to: CGPoint(x: x*0.48, y: y*0.45))
            path.addLine(to: CGPoint(x: x*0.5, y: y*0.2))
            path.addLine(to: CGPoint(x: x*0.3, y: y*0.45))
            path.addLine(to: CGPoint(x: x*0.52, y: y*0.55))
            path.addLine(to: CGPoint(x: x*0.5, y: y*0.8))

            path.closeSubpath()
            
            context.stroke(path, with: .color(.yellow), lineWidth: 5)
            context.fill(path, with: .color(.yellow))
        }
        .scaleEffect(isAnimating ? 1.5 : 1)
        .animation(Animation.easeInOut(duration: 0.3).repeatCount(6, autoreverses: true))
        .onAppear {
            isAnimating = true
        }
    }
}



