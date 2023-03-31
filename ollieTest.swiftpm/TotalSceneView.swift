//
//  TotalSceneView.swift
//  playgroundtest
//
//  Created by sei on 2023/03/31.
//

import SwiftUI

struct TotalSceneView: View {
    @EnvironmentObject var sceneManager: SceneManager
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Group {
                    switch sceneManager.currentScene {
                    case .zero:
                        Scene0View()
                    case .one:
                        Scene1View()
                    case .two:
                        Scene2View()
                    case .three:
                        Scene3View()
                    case .four:
                        Scene4View()
                    case .five:
                        Scene5View()
                    case .six:
                        Scene6View()
                    case .rew:
                        SceneRewView()
                    }
                }
                .overlay(
                    ScaledToFitImage(fileName: Frame.body).allowsHitTesting(false)
                )
            }
            FrameLeftView()
        }
        .ignoresSafeArea()
    }
}

