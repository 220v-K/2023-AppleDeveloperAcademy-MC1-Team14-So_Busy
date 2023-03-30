//
//  SceneManager.swift
//  playgroundtest
//
//  Created by sei on 2023/03/31.
//

import Foundation
import SwiftUI

class SceneManager: ObservableObject {
    private static func createSceneModel() -> SceneModel {
        return SceneModel()
    }
    @Published private var model = createSceneModel()
    
    var currentScene: SceneModel.SceneType {
        model.currentScene
    }
    
    var leftImage: String {
        switch currentScene {
        case .zero:
            return Frame.ButtonClicked.none
        case .one:
            return Frame.ButtonClicked.one
        case .two:
            return Frame.ButtonClicked.two
        case .three:
            return Frame.ButtonClicked.three
        case .four:
            return Frame.ButtonClicked.four
        case .five:
            return Frame.ButtonClicked.five
        case .six:
            return Frame.ButtonClicked.six
        case .rew:
            return Frame.ButtonClicked.rew
        }
    }
    
    @Published var sceneThreePapers = [Paper]()
    @Published var sceneOneOpacity = 1.0
    func changeScene(to scene: SceneModel.SceneType) {
        if currentScene == .one && scene == .two {
            withAnimation(.easeInOut(duration: 0.3)) {
                sceneOneOpacity = 0.0
            }
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
                self?.model.changeScene(to: scene)
                self?.sceneOneOpacity = 1.0
            }
        } else {
            
            model.changeScene(to: scene)
        }
    }
}

// scene 3
extension SceneManager {
    var sceneThreeOpacity: Double {
        switch sceneThreePapers.count {
        case 0:
            return 0.01
        case ...6:
            return 1/6
        case ...12:
            return 2/6
        case ...(6*3):
            return 3/6
        case ...(6*4):
            return 4/6
        case ...(6*6):
            return 5/6
        default:
            return 1
        }
    }
    
    func add(paper: Paper) {
        sceneThreePapers.append(paper)
    }
}
