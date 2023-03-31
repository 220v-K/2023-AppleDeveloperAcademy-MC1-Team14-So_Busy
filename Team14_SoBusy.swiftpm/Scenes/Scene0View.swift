//
//  Scene0View.swift
//  playgroundtest
//
//  Created by sei on 2023/03/31.
//

import SwiftUI
import AVFoundation

struct Scene0View: View {
    @EnvironmentObject private var sceneManager: SceneManager
    @StateObject private var soundManager = SoundManager()
    
    @State var player: AVAudioPlayer?
    
    @State var tapeAngle:Double = 0.0
    @State var tapeScale:Double = 2.0
    @State var tapeOffsetX:Double = 0
    
    @State var backgroundPlayerImageURL:String = "Frame_all_mainBefore"
    @State var tapeOpacity:Double = 1.0
    
    var body: some View {
        ZStack{
            Image(backgroundPlayerImageURL).resizable().background(.black).onTapGesture {
                withAnimation(.linear(duration: 2.0), {
                    sceneManager.changeScene(to: .one)
                })
            }
            Image("tapePic").scaleEffect(tapeScale)
                .rotationEffect(Angle(degrees: tapeAngle))
                .offset(x:tapeOffsetX)
                .opacity(tapeOpacity)
                .onTapGesture {
                    //                soundManager.play(sound: .introTapeSound, volume: 1.0)
                    playTapeSound()
                    for i in 1...4{
                        withAnimation(.linear(duration: 2.0).delay(2.0*Double((i-1))), {
                            tapeScale = 2.0 - 0.25*Double(i)
                        })
                        withAnimation(.linear(duration: 2.0).delay(2.0*Double((i-1))), {
                            tapeAngle = Double(0 - 360*i)
                        })
                    }
                    withAnimation(.linear(duration: 8), {
                        tapeOffsetX = 80
                    })
                    withAnimation(.linear(duration: 3.0).delay(8), {
                        tapeScale = 0.5
                        tapeAngle = -360*4-62.5
                    })
                    withAnimation(.linear(duration: 2.0).delay(11), {
                        tapeOpacity = 0.0
                        backgroundPlayerImageURL = "Frame_all_mainAfter"
                    })
                }
        }
    }
    
    func playTapeSound() {
        guard let url = Bundle.main.url(forResource: "introTapeSound", withExtension: "m4a") else {
            print("사운드못가져옴")
            return }
        do {
            player?.pause()
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 1.0
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
