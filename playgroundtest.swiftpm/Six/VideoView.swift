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
    @Binding var customPlayer: AVPlayer
    
    var body: some View {
        VideoPlayer(player: customPlayer)
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                self.customPlayer.play()
            }
        
        
    }
}
