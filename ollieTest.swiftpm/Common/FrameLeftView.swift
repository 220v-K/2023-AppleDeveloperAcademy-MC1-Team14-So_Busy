//
//  FrameLeftView.swift
//  playgroundtest
//
//  Created by sei on 2023/03/30.
//

import SwiftUI

struct FrameLeftView: View {
    @EnvironmentObject private var sceneManager: SceneManager
    
    @StateObject private var soundManager = SoundManager()
    
    var body: some View {
        ScaledToFitImage(fileName: sceneManager.leftImage)
            .gesture( DragGesture(minimumDistance: 0)
                .onEnded({ value in
                    //                    let x = value.location.x, y = value.location.y
                    //                    print("On End!")
                    //                    if (46...125).contains(x),
                    //                       (650...730).contains(y) {
                    //
                    //                        image = Frame.ButtonClicked.none
                    //                    }
                    
                })
                    .onChanged({ value in
                        print("On Change!")
                        print(value.location)
                        let x = value.location.x, y = value.location.y
                        
                        soundManager.play(sound: .button, volume: 1.0)
                        
                        switch (x, y) {
                        case (46...160, 650..<730):
                            sceneManager.changeScene(to: .rew)
                        case (46...160, 550..<635):
                            sceneManager.changeScene(to: .one)
                        case (46...160, 460..<550):
                            sceneManager.changeScene(to: .two)
                        case (46...160, 360..<450):
                            sceneManager.sceneThreePapers = []
                            sceneManager.changeScene(to: .three)
                        case (46...160, 270..<350):
                            sceneManager.changeScene(to: .four)
                        case (46...160, 180..<260):
                            sceneManager.changeScene(to: .five)
                        case (46...160, 85..<170):
                            sceneManager.changeScene(to: .six)
                        default:
                            return
                        }
                    })
            )
    }
}

