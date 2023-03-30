//
//  VideoView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//
// video 여러 개 dynamic하게 변경 reference - https://stackoverflow.com/questions/68559900/swiftui-videoplayer-to-display-different-videos-stored-locally-back-and-forwar

import SwiftUI
import AVKit

struct VideoView: View {
    let videoNames: [String]
    
    @State var customPlayer: AVPlayer

    init(videoNames: [String]) {
        self.videoNames = videoNames
        self._customPlayer = State(initialValue: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoNames[0], ofType: "mp4")!)))
    }

    var body: some View {
        VideoPlayer(player: customPlayer)
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                self.customPlayer.play()
            }
            .onTapGesture {
                self.customPlayer.pause()
                self.customPlayer = AVPlayer(url: Bundle.main.url(forResource: "video", withExtension: "mp4")!)
                self.customPlayer.play()
            }
        
        
    }
}
