//
//  SceneThree.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

struct SceneThreeView: View {
    @State private var papers = [Paper]()
    @State private var opacity = 0.01
    let onceCount = 3
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                GeometryReader { geometry in
                    Image("bg_3")
                    CookiesView(size: geometry.size.height / 3)
                    Color.black
                        .opacity(opacity)
                    TapeImageView(type: TapeImage.body)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded({ value in
                                    var count = 1

                                    Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
                                        if (count == onceCount) {
                                            timer.invalidate()
                                        }
                                        let position = CGSize(width: value.location.x + .random(in: -20...60), height: value.location.y + .random(in: -45...45))
                                        let paperObject = Paper(position: position)
                                        
                                        count += 1
                                        papers.append(paperObject)
                                        print("[DEBUG] - Number: \(count)")
                                    }
                                })
                        )
                }
            }
            TapeImageView(type: TapeImage.button)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func CookiesView(size: CGFloat) -> some View {
        Group {
            ForEach(papers.indices, id: \.self) { index in
                let rotation: Double = .random(in: -20...20)
                
                BackgroundView(name:"3_paper_1")
//                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .offset(x:papers[index].position.width, y: papers[index].position.height)
                    .rotationEffect(.init(degrees: rotation))
                    .scaleEffect(papers[index].isAdded ? 1 : 20, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            papers[index].isAdded = true
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.opacity = Double(papers.count) / (12 * Double(onceCount))
                        }
                    }
            }
        }
    }
}
