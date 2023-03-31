//
//  Scene.swift
//  playgroundtest
//
//  Created by sei on 2023/03/31.
//

import Foundation

struct SceneModel {
    enum SceneType {
        case zero, one, two, three, four, five, six, rew
    }
    
    enum SceneThreePhase {
        case start, one, two, three, four, five, six
    }
    
    private(set) var currentScene: SceneType = .zero
    
    private(set) var currentSceneThreePhase: SceneThreePhase = .start
    
    mutating func changeScene(to sc: SceneType) {
        currentScene = sc
    }
}
