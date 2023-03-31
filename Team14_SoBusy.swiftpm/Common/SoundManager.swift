//
//  SoundManager.swift
//  playgroundtest
//
//  Created by sei on 2023/03/30.
//

import Foundation
import AVFoundation

final class SoundManager: ObservableObject {
    
    enum Sound: String {
        case paper1
        case paper2
        case thunder
        case button
        case iMessage
        case introTapeSound
    }
    
    var audioPlayer: AVPlayer?
    
    func play(sound fileName: Sound, volume: Float) {
        audioPlayer?.pause()
        
        guard let url = Bundle.main.url(forResource: fileName.rawValue, withExtension: "mp3") else {
            print("파일을 찾을 수 없음")
            return
        }
        
        audioPlayer = AVPlayer(url: url)
        audioPlayer?.play()
    }
}
