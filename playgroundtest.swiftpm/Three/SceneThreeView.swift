//
//  SceneThree.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

struct SceneThreeView: View {
    @StateObject private var soundManager = SoundManager()
    @Binding var sceneNum: Int
    
    @State private var papers = [Paper]()
    @State private var opacity = 0.01
    let onceCount = 3
    
    var body: some View {
        HStack(spacing: .zero) {
            ZStack {
                GeometryReader { geometry in
                    ScaledToFitImage(fileName: Background.three)
                    CookiesView(size: geometry.size.height / 3)
                    Color.black.opacity(opacity)
                    ScaledToFitImage(fileName: Frame.body)
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
                                let paperObject = Paper(name:"paper_\(Int.random(in: 1...6))", position: position, degree: degree)
                                
                                count += 1
                                papers.append(paperObject)
                                soundManager.play(sound: .paper1, volume: 1.0)
                            }
                        })
                )
            }
//            FrameLeftView(sceneNum: $sceneNum)
            ScaledToFitImage(fileName: "Frame_right_3Click").onTapGesture {
                sceneNum = 4
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func CookiesView(size: CGFloat) -> some View {
        Group {
            ForEach(papers.indices, id: \.self) { index in
                Image(papers[index].name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .offset(x:papers[index].x, y: papers[index].y)
                    .rotationEffect(.init(degrees: papers[index].degree))
                    .scaleEffect(papers[index].isAdded ? 1 : 20, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            papers[index].isAdded = true
                        }
                        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                            self.opacity = Double(papers.count) / (6 * Double(onceCount))
                        }
                    }
            }
        }
    }
}
