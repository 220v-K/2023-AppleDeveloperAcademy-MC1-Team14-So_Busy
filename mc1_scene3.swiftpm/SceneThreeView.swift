//
//  SceneThreeView.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI
import SpriteKit

struct SceneThreeView: View {
    @State private var cookies = [Cookie]()
    @State private var opacity = 0.01
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                GeometryReader { geometry in
                    Color.blue
                    CookiesView(size: geometry.size.height / 5)
                    Color.black
                        .opacity(opacity)
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
            ZStack {
                Color.yellow
                    .frame(width: 200)
                Text("대충 카세트 버튼")
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func CookiesView(size: CGFloat) -> some View {
        Group {
            ForEach(cookies.indices, id: \.self) { index in
                Image("cookie_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .offset(x:cookies[index].x, y: cookies[index].y)
                    .scaleEffect(cookies[index].isAdded ? 1 : 20, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            cookies[index].isAdded = true
                            
                        }
                        withAnimation(.easeInOut(duration: 1.5)) {
                            self.opacity = Double(cookies.count) / 6.0
                        }
                    }
            }
        }
    }
}
