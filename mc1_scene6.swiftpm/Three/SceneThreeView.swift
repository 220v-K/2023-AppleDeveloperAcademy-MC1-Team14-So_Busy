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
                                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                        if (count == onceCount) {
                                            timer.invalidate()
                                        }
                                        let degree: Double = .random(in: -20...20)
                                        let position = CGPoint(x:value.location.x + .random(in: -20...60), y: value.location.y + .random(in: -45...45))
                                        let paperObject = Paper(name:"paper_\(Int.random(in: 1...6))", position: position, degree: degree)
                                        
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
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.opacity = Double(papers.count) / (12 * Double(onceCount))
                        }
                    }
            }
        }
    }
}
