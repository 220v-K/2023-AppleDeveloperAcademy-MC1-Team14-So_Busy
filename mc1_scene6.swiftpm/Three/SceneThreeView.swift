//
//  SceneThree.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

struct SceneThreeView: View {
    @State private var cookies = [Cookie]()
    @State private var opacity = 0.01
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                GeometryReader { geometry in
                    BackgroundView(name: "scene3background")
                    CookiesView(size: geometry.size.height / 3)
                    Color.black
                        .opacity(opacity)
                    TapeImageView(type: TapeImage.body)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded({ value in
                                    print(value.location)
                                    let cookieObject = Cookie(position: value.location)
                                    cookies.append(cookieObject)
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
            ForEach(cookies.indices, id: \.self) { index in
                BackgroundView(name:"3_paper_1")
//                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .offset(x:cookies[index].x, y: cookies[index].y)
                    .scaleEffect(cookies[index].isAdded ? 1 : 20, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            cookies[index].isAdded = true
                        }
                        withAnimation(.easeInOut(duration: 2)) {
                            self.opacity = Double(cookies.count) / 12
                        }
                    }
            }
        }
    }
}
