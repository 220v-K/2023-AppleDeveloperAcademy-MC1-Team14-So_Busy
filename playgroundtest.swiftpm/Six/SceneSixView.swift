//
//  SceneSixView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI
import AVKit

struct SceneSixView: View {
    @State var customPlayer =  AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "six", ofType: "mp4")!))
    @Binding var sceneNum: Int
    @State var videoIndex: Int = 0
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                VideoView( customPlayer: $customPlayer)
                ScaledToFitImage(fileName: Frame.body)
            }
            .onTapGesture {
                customPlayer.pause()
                self.customPlayer = AVPlayer(url: Bundle.main.url(forResource: "six_rew", withExtension: "mp4")!)
                self.customPlayer.play()
            }
            FrameLeftView(sceneNum: $sceneNum)
        }
        .ignoresSafeArea()
    }
}
