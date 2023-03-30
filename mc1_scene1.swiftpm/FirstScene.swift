import SwiftUI
import SpriteKit


struct FirstScene: View {
    
    @State private var opacity = 0.0
    
    var scene: SKScene {
        let scene = CloudFloatingScene()
        scene.size = CGSize(width: 850, height: 700)
        scene.physicsWorld.gravity = CGVectorMake(0.0, 0.3);
        
        scene.backgroundColor = UIColor(displayP3Red: 192/255, green: 213/255, blue: 220/255, alpha: 0)
        
        return scene
    }

    var body: some View {
        HStack {
            ZStack {
                
                SpriteView(scene: scene)
                    .frame(width: 850, height: 700)
                    .zIndex(1)
                    
                Rectangle()
                    .frame(width: 850, height: 700)
                    .foregroundColor(.black)
                    .opacity(opacity)
                    .zIndex(2)
                    .animation(.easeOut(duration: 1.5), value: opacity)
            }
            VStack {
                Button(action: {
                        opacity = 0.0
                }) {
                    Image(systemName: "1.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.black)
                }
                Button(action: {
                        opacity = 1
                }) {
                    Image(systemName: "2.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}
