//
//  Scene3View.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

struct Scene3View: View {
    @EnvironmentObject private var sceneManager: SceneManager
    
    @StateObject private var soundManager = SoundManager()

    let onceCount = 3
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScaledToFitImage(fileName: BackgroundImage.three)
                CookiesView(size: geometry.size.height / 3)
                Color.black.opacity(sceneManager.sceneThreeOpacity)
            }.gesture(
                DragGesture(minimumDistance: .zero)
                    .onEnded({ value in
                        var count = 1
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                            if (count == onceCount) {
                                timer.invalidate()
                            }
                            let degree: Double = .random(in: -20...20)
                            let position = CGPoint(x:value.location.x + .random(in: -20...60), y: value.location.y + .random(in: -45...45))
                            let paperObject = Paper(name: PaperImage.randomElement().rawValue, position: position, degree: degree)
                            
                            count += 1
                            sceneManager.add(paper: paperObject)
                        }
                        soundManager.play(sound: [SoundManager.Sound.paper1, SoundManager.Sound.paper2].randomElement()!, volume: 1.0)
                    })
            )
        }
    }
    
    @ViewBuilder
    func CookiesView(size: CGFloat) -> some View {
        Group {
            ForEach(sceneManager.sceneThreePapers.indices, id: \.self) { index in
                Image(sceneManager.sceneThreePapers[index].name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .offset(x:sceneManager.sceneThreePapers[index].x, y: sceneManager.sceneThreePapers[index].y)
                    .rotationEffect(.init(degrees: sceneManager.sceneThreePapers[index].degree))
                    .scaleEffect(sceneManager.sceneThreePapers[index].isAdded ? 1 : 20, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            sceneManager.sceneThreePapers[index].isAdded = true
                        }
                    }
            }
        }
    }
}
