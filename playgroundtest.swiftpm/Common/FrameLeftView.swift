//
//  FrameLeftView.swift
//  playgroundtest
//
//  Created by sei on 2023/03/30.
//

import SwiftUI

struct FrameLeftView: View {
    @StateObject private var soundManager = SoundManager()
    @Binding var sceneNum: Int
    @State var image: String = Frame.ButtonClicked.none
    var body: some View {
        ScaledToFitImage(fileName: image)
            .gesture( DragGesture(minimumDistance: 0)
                .onEnded({ value in
                    print("onEnd")
                    
//                    let x = value.location.x, y = value.location.y
                    
//                    if (46...125).contains(x),
//                       (650...730).contains(y) {
//                        image = Frame.ButtonClicked.none
//                    }
                    
                })
                    .onChanged({ value in
                        print(value.location)
                        let x = value.location.x, y = value.location.y
                        
                        soundManager.play(sound: .button, volume: 1.0)

                        switch (x, y) {
                        case (46..<124, 650..<730):
                            image = Frame.ButtonClicked.rew
                        case (46..<124, 550..<635):
                            image = Frame.ButtonClicked.one
                        default:
                            return
                        }
                        if value.location.x > 46 && value.location.x < 124
                            && value.location.y > 650 && value.location.y < 730 {
                            image = Frame.ButtonClicked.rew
                        } else if (x > 46) && (x < 124) && (y > 550) && (y < 635) {
                            image = Frame.ButtonClicked.one
                        } else if (x > 46) && (x < 124) && (y > 460) && (y < 550) {
                            image = Frame.ButtonClicked.two
                        } else if (x > 46) && (x < 124) && (y > 360) && (y < 450) {
                            image = Frame.ButtonClicked.three
                        } else if (x > 46) && (x < 124) && (y > 270) && (y < 350) {
                            image = Frame.ButtonClicked.four
                        } else if (x > 46) && (x < 124) && (y > 180) && (y < 260) {
                            image = Frame.ButtonClicked.five
                        } else if (x > 46) && (x < 124) && (y > 85) && (y < 170) {
                            image = Frame.ButtonClicked.six
                        }
                    })
            )
    }
}

