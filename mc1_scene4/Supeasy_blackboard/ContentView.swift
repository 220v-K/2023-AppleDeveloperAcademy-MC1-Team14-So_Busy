//
//  ContentView.swift
//  Supeasy_blackboard
//
//  Created by 조용현 on 2023/03/28.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var draggedOffset = CGSize.zero
    @State private var accumulatedOffset = CGSize.zero
    
    @State var scale:CGFloat = 1.0
    @State var image = "white"
    
    @State var showFrame = false
    @State var circleOpacity = 0.0
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                draggedOffset = accumulatedOffset + gesture.translation
            }
            .onEnded { gesture in
                accumulatedOffset = accumulatedOffset + gesture.translation
            }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                
                Image(image).resizable().frame(width: 800, height: 800)
                ZStack {
                    Color.black.opacity(0.5)
                    TapeImageView(type: TapeImage.body)
                    ZStack {
                        //                        if showCircle {
                        Group {
                            ZStack {
                                Circle()
                                    .frame(width: 80, height: 80)
                                    .blendMode(.destinationOut)
                                    .foregroundColor(.yellow)
                                    .opacity(1)
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .blendMode(.destinationOut)
                                    .foregroundColor(.yellow)
                                    .opacity(0.8)
                            }
                        }.scaleEffect(scale).offset(draggedOffset).gesture(simpleDrag).opacity(circleOpacity)
                        //                        }
                    }
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                //                                showCircle = true
                                circleOpacity = 1.0
                            }
                        }
                        
                        
                    }
                    
                    Group {
                        Button(action: {
                            print("tapped!")
                            withAnimation(.easeInOut(duration: 2.0)){
                                scale = 30.0
                            }
                            image = "white"
                        }, label: {
                            Text("Continue")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 40)
                                .background(Color.green)
                                .cornerRadius(15)
                                .padding()
                        })
                    }.offset(x: 140, y: -120)
                }
                .compositingGroup()
                
            }
            TapeImageView(type: TapeImage.button)
        }.ignoresSafeArea()
    }
}

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
