import SwiftUI
import SpriteKit
import CoreLocation
import Combine



struct FirstScene: View {
    @Binding var sceneNum: Int
    @State private var opacity = 0.0
    @State var rightImage: String = "Frame_right"
    
    
    var scene: SKScene {
        let scene = CloudFloatingScene()
        scene.size = CGSize(width: 1004.5, height: 815.5)
        scene.physicsWorld.gravity = CGVectorMake(0.0, 0.3);
        scene.backgroundColor = UIColor(displayP3Red: 174/255, green: 172/255, blue: 170/255, alpha: 1)
        
        return scene
    }

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                
                Image("Frame_left")
                    .resizable()
                    .frame(width: 1004.5, height: 815.5)
                    .zIndex(1)
                
                SpriteView(scene: scene)
                    .frame(width: 950.5, height: 750.5)
                    .zIndex(2)
                    
                Rectangle()
                    .frame(width: 950.5, height: 750.5)
                    .foregroundColor(.black)
                    .opacity(opacity)
                    .zIndex(3)
                    .animation(.easeOut(duration: 1.5), value: opacity)
            }
            VStack {
                Image(rightImage)
                    .resizable()
                    .frame(width: 150, height: 815.5)
                    .gesture( DragGesture(minimumDistance: 0)
                        .onEnded({ value in
                            print(value.location)
                            let x = value.location.x
                            let y = value.location.y
                            
                            if (x > 46) && (x < 124) && (y > 650) && (y < 730) {
                                rightImage = "Frame_right"
                            } else if (x > 46) && (x < 124) && (y > 550) && (y < 635) {
                                rightImage = "Frame_right_1Click"
                            } else if (x > 46) && (x < 124) && (y > 460) && (y < 550) {
                                rightImage = "Frame_right_2Click"
                                sceneNum += 1
                            } else if (x > 46) && (x < 124) && (y > 360) && (y < 450) {
                                rightImage = "Frame_right_3Click"
                            } else if (x > 46) && (x < 124) && (y > 270) && (y < 350) {
                                rightImage = "Frame_right_4Click"
                            } else if (x > 46) && (x < 124) && (y > 180) && (y < 260) {
                                rightImage = "Frame_right_5Click"
                            } else if (x > 46) && (x < 124) && (y > 85) && (y < 170) {
                                rightImage = "Frame_right_6Click"
                            }
                        })
                        .onChanged({ value in
                            print(value.location)
                            let x = value.location.x
                            let y = value.location.y

                            if value.location.x > 46 && value.location.x < 124
                                && value.location.y > 650 && value.location.y < 730 {
                                rightImage = "Frame_right_RewClick"
                            } else if (x > 46) && (x < 124) && (y > 550) && (y < 635) {
                                rightImage = "Frame_right_1Click"
                            } else if (x > 46) && (x < 124) && (y > 460) && (y < 550) {
                                rightImage = "Frame_right_2Click"
                            } else if (x > 46) && (x < 124) && (y > 360) && (y < 450) {
                                rightImage = "Frame_right_3Click"
                            } else if (x > 46) && (x < 124) && (y > 270) && (y < 350) {
                                rightImage = "Frame_right_4Click"
                            } else if (x > 46) && (x < 124) && (y > 180) && (y < 260) {
                                rightImage = "Frame_right_5Click"
                            } else if (x > 46) && (x < 124) && (y > 85) && (y < 170) {
                                rightImage = "Frame_right_6Click"

                            }
                        })
                    )
                    
                
                
//                Button(action: {
//                        opacity = 0.0
//                }) {
//                    Image(systemName: "1.circle")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .symbolRenderingMode(.monochrome)
//                        .foregroundStyle(.black)
//                }
//                Button(action: {
//                        opacity = 1
//                }) {
//                    Image(systemName: "2.circle")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .symbolRenderingMode(.monochrome)
//                        .foregroundStyle(.black)
//                }
            }
        }
    }
}


