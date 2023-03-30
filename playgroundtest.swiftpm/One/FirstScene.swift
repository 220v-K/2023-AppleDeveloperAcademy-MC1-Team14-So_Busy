import SwiftUI
import SpriteKit
import CoreLocation
import Combine
import AVFoundation


struct FirstScene: View {
    @StateObject private var soundManager = SoundManager()
    @Binding var sceneNum: Int
    @State private var opacity = 0.0
    @State var rightImage: String = Frame.ButtonClicked.none

    @State var currentScene: SKScene?
    @State var player: AVAudioPlayer?


    var scene: SKScene {
        let scene = CloudFloatingScene()
        scene.size = CGSize(width: 940, height: 765)
        scene.physicsWorld.gravity = CGVectorMake(0.0, 0.3)
        scene.backgroundColor = UIColor(displayP3Red: 174/255, green: 172/255, blue: 170/255, alpha: 1)
        return scene
    }

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                ScaledToFitImage(fileName: Frame.body)
                
                SpriteView(scene: scene)
                    .frame(width: 940, height: 765)
                    .cornerRadius(CGFloat(20))
                    .padding(.leading, 20)
                    .padding(.bottom, 5)
                    .zIndex(1)
                
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(opacity)
                    .zIndex(2)
                    .animation(.easeOut(duration: 1.5), value: opacity)
            }
            
            ScaledToFitImage(fileName: rightImage)
                .gesture( DragGesture(minimumDistance: 0)
                    .onEnded({ value in
                        let x = value.location.x
                        let y = value.location.y
                        
                        if (x > 46) && (x < 124) && (y > 650) && (y < 730) {
                            rightImage = "Frame_right"
                        }
                    })
                    .onChanged({ value in
                        let x = value.location.x
                        let y = value.location.y
                        
                        soundManager.play(sound: .button, volume: 1.0)

                        if (x > 46) && (x < 124) && (y > 650) && (y < 730) {
                            rightImage = "Frame_right_RewClick"
                            opacity = 0
                            sceneNum = 1
                        } else if (x > 46) && (x < 124) && (y > 550) && (y < 635) {
                            rightImage = "Frame_right_1Click"
                            opacity = 0
                        } else if (x > 46) && (x < 124) && (y > 460) && (y < 550) {
                            rightImage = "Frame_right_2Click"
                            opacity = 1
                            sceneNum = 2
                        } else if (x > 46) && (x < 124) && (y > 360) && (y < 450) {
                            rightImage = "Frame_right_3Click"
                            opacity = 1
                            sceneNum = 3
                        } else if (x > 46) && (x < 124) && (y > 270) && (y < 350) {
                            rightImage = "Frame_right_4Click"
                            opacity = 1
                            sceneNum = 4
                        } else if (x > 46) && (x < 124) && (y > 180) && (y < 260) {
                            rightImage = "Frame_right_5Click"
                            opacity = 1
                            sceneNum = 5
                        } else if (x > 46) && (x < 124) && (y > 85) && (y < 170) {
                            rightImage = "Frame_right_6Click"
                            opacity = 1
                            sceneNum = 6
                        }
                    })
                )
        }.ignoresSafeArea()
    }
}


