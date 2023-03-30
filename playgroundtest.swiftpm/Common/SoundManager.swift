//
//  SoundManager.swift
//  playgroundtest
//
//  Created by sei on 2023/03/30.
//

import Foundation
import AVFoundation

final class SoundManager: ObservableObject {
    var audioPlayer: AVPlayer?
    
    func play(sound fileName: String, volume: Float) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("파일을 찾을 수 없음")
            return
        }
        
        audioPlayer = AVPlayer(url: url)
        audioPlayer?.play()
    }
}
