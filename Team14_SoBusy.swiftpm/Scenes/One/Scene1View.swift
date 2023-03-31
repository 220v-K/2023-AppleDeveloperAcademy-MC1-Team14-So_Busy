import SwiftUI
import SpriteKit
import CoreLocation
import Combine
import AVFoundation


struct Scene1View: View {
    @EnvironmentObject private var sceneManager: SceneManager
    @StateObject private var soundManager = SoundManager()
    
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
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .zIndex(1)
            
            SpriteView(scene: scene)
                .frame(width: 940, height: 765)
                .cornerRadius(CGFloat(20))
                .padding(.leading, 20)
                .padding(.bottom, 5)
                .zIndex(3)
                .opacity(sceneManager.sceneOneOpacity)
            
        }
    }
}


