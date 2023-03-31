//
//  VideoView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI
import AVKit

struct VideoView: View {
    let fileName: String
    let delayTime: TimeInterval
    
    var body: some View {
        let customPlayer =  AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "mp4")!))
        
        VideoPlayer(player: customPlayer)
            .edgesIgnoringSafeArea(.all)
            .onAppear() {
                Timer.scheduledTimer(withTimeInterval: delayTime, repeats: false) { _ in
                    customPlayer.play()
                }
            }
    }
}
