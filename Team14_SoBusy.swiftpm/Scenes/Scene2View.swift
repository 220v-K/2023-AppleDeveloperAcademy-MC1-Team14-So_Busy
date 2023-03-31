import SwiftUI
import AVFoundation

struct Scene2View: View {
    @EnvironmentObject private var sceneManager: SceneManager
    
    @State var player: AVAudioPlayer?
    
    @State private var isAnimating = false
    @State private var index = -1
    @State private var showImage = false
    @State var showLetters = false
    
    @State var shakeAngle :Double = 0.0
    
    @State private var angle: Angle = .degrees(0)
    @State private var scale: CGFloat = 0.1
    
    let letters = ["대상이", "불명확", "피드백의", "정의가", "모호"]
    let nums = [1, 2]
    
    var body: some View {
        ZStack {
            Color.black
            if showImage {
                Image("thunder")
                    .resizable()
            }
            
            
            if showLetters {
                ZStack{
                    // 잔상 효과. 샤샤샥!
                    //                    ForEach(nums, id: \.self){ i in
                    //                        Text(letters[index])
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(.white).opacity(0.6 + 0.2*Double(i))
                    //                            .font(.system(size: 100))
                    //                            .rotationEffect(Angle.degrees(Double(3*i + 6)))
                    //                        Text(letters[index])
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(.white).opacity(0.6 + 0.2*Double(i))
                    //                            .font(.system(size: 100))
                    //                            .rotationEffect(Angle.degrees(Double(-3*i - 6)))
                    //                    }
                    //                    ForEach(nums, id: \.self){ i in
                    //                        Text(letters[index])
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(.black).opacity(1.0 - 0.2*Double(i))
                    //                            .font(.system(size: 100))
                    //                            .rotationEffect(Angle.degrees(Double(3*i)))
                    //                        Text(letters[index])
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(.black).opacity(1.0 - 0.2*Double(i))
                    //                            .font(.system(size: 100))
                    //                            .rotationEffect(Angle.degrees(Double(-3*i)))
                    //                    }
                    Text(letters[index])
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                }.scaleEffect(scale)
                    .rotationEffect(angle)
                    .onAppear{
                        // 띠용띠용 애니메이션
                        withAnimation(Animation.easeInOut(duration: 0.15).delay(0.2)){
                            angle = .degrees(20)
                        }
                        withAnimation(Animation.easeInOut(duration: 0.15).delay(0.35)){
                            angle = .degrees(-20)
                        }
                        withAnimation(Animation.easeInOut(duration: 0.3).delay(0.5)){
                            angle = .degrees(20)
                        }
                        withAnimation(Animation.easeInOut(duration: 0.3).delay(0.8)){
                            angle = .degrees(-20)
                        }
                        withAnimation(Animation.easeInOut(duration: 0.5).delay(1.1)){
                            angle = .degrees(0)
                        }
                        
                        // 커지는 애니메이션 슉슉
                        withAnimation(Animation.easeInOut(duration: 0.1).delay(0.1)){
                            scale = 1.0
                        }
                        withAnimation(Animation.easeInOut(duration: 0.15).delay(0.2)){
                            scale = 2.0
                        }
                        withAnimation(Animation.easeInOut(duration: 0.15).delay(1.45)){
                            scale = 0.1
                        }
                    }
            }
        }.onTapGesture {
            // play Thunder sound
            playThunderSound()
            
            if index < letters.count - 1 {
                index += 1
            } else {
                index = 0
            }
            
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = false
            }
            
            withAnimation(.easeInOut(duration: 1), {
                showImage = true
                showLetters = true
            })
            //                    showImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeIn(duration: 1), {
                    showImage = false
                    showLetters = false
                })
            }
        }
    }
    
    
    func playThunderSound() {
        guard let url = Bundle.main.url(forResource: "thunderSound", withExtension: "mp3") else {
            print("사운드못가져옴")
            return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 1.0
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

