//
//  Scene5View.swift
//  playgroundtest
//
//  Created by 이재원 on 2023/03/30.
//

import SwiftUI

struct Scene5View: View {
    @Binding var sceneNum: Int
    
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var views: [Bool] = []
    // 양봉,음봉 여부 / 박스 길이 / 윗 선 길이 / 아랫 선 길이 / 현재 y축
    @State var stocks: [(Bool, Double, Double, Double, Double)] = []
    @State var stockLength: [Int] = []
    
    var body: some View {
        HStack(spacing: .zero) {
            ZStack {
                Image("Frame_left").resizable()
                VStack{
                    Spacer().frame(height: 40)
                    ZStack{
                        // 주식 그래프 표시
                        VStack{
                            Spacer()
                            HStack(alignment: .bottom){
                                Spacer().frame(width: 50)
                                ForEach(stockLength, id: \.self) { index in
                                    stockLineBox(isPlus: stocks[index].0, boxHeight: stocks[index].1, upLineHeight: stocks[index].2, downLineHeight: stocks[index].3, height: stocks[index].4)
                                }
                                Spacer()
                                Spacer().frame(width: 20)
                            }
                        }
                        VStack{
                            Spacer()
                            ForEach(views, id: \.self) { viewIsMine in
                                HStack {
                                    if viewIsMine{ Spacer() } else { Spacer().frame(width: 30) }
                                    ChatBubble(isMine: viewIsMine).frame(width: 150, height: 80)
                                    if viewIsMine{ Spacer().frame(width: 20) } else { Spacer() }
                                }
                            }
                        }
                    }
                    chatBottom(views : $views, stocks : $stocks, stockLength: $stockLength)
                    Spacer().frame(height: 40)
                }
            }
            ScaledToFitImage(fileName: "Frame_right_5Click").onTapGesture {
                    sceneNum += 1
                }
        }.ignoresSafeArea()
    }
}

struct stockLineBox: View{
    var isPlus:Bool
    var boxHeight:Double
    var upLineHeight:Double
    var downLineHeight:Double
    var height:Double
    
    var body: some View{
        VStack(spacing: 0) {
            Rectangle()
                .fill(isPlus ? .red : .blue)
                .frame(width: 3, height: upLineHeight)
            Rectangle()
                .fill(isPlus ? .red : .blue)
                .frame(width: 30, height: boxHeight)
            Rectangle()
                .fill(isPlus ? .red : .blue)
                .frame(width: 3, height: downLineHeight)
        }.offset(y:-height)
    }
}

struct ChatBubble: View {
    var isMine: Bool
    
    var body: some View {
        ZStack {
            // Draw the speech bubble shape
            Path { path in
                path.move(to: CGPoint(x: 50, y: 0))
                path.addQuadCurve(to: CGPoint(x: 30, y: 20), control: CGPoint(x: 30, y: 0))
                path.addLine(to: CGPoint(x: 30, y: 50))
                path.addQuadCurve(to: CGPoint(x: 50, y: 70), control: CGPoint(x: 30, y: 70))
                path.addLine(to: CGPoint(x: 110, y: 70))
                path.addQuadCurve(to: CGPoint(x: 130, y: 50), control: CGPoint(x: 130, y: 70))
                path.addLine(to: CGPoint(x: 130, y: 20))
                path.addQuadCurve(to: CGPoint(x: 110, y: 0), control: CGPoint(x: 130, y: 0))
                
                if isMine {
                    path.move(to: CGPoint(x: 130, y: 50))
                    path.addLine(to: CGPoint(x: 150, y: 40))
                    path.addLine(to: CGPoint(x: 130, y: 30))
                } else {
                    path.move(to: CGPoint(x: 30, y: 50))
                    path.addLine(to: CGPoint(x: 10, y: 40))
                    path.addLine(to: CGPoint(x: 30, y: 30))
                }
                
                
                path.closeSubpath()
            }
            .fill(isMine ? Color(red: 135/255, green: 206/255, blue: 235/255) : Color.pink.opacity(0.8))
            
            // Add the text inside the speech bubble
            Text(isMine ? "차" : "영")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .offset(x:6, y:-10)
        }
    }
}

struct chatBottom: View{
    @StateObject private var soundManager = SoundManager()
    
    @Binding var views:[Bool]
    @Binding var stocks: [(Bool, Double, Double, Double, Double)]
    @Binding var stockLength: [Int]
    
    @State var isMineToggle:Bool = false
    @State var nowHeight:Double = 0.0
    @State var index:Int = 0
    
    // to make TextField, not used.
    @State var textInit:String = ""
    
    
    var body: some View{
        HStack{
            Spacer().frame(width: 30)
            Button(action: {
                
            }) {
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 50, height: 40)
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(.gray)
            }
            
            
            TextField("Enter any text", text: $textInit)
                .padding()
                .background(.white)
                .textFieldStyle(.roundedBorder)
                .disabled(true)
                .frame(width: 800)
            
            Button(action: {
                views.append(isMineToggle)
                isMineToggle.toggle()
                if(views.count >= 8 ){
                    views.removeFirst()
                    // 양봉 음봉 랜덤 추가 (3:7정도의 비율과 확률, 양봉의 길이가 더 길 수 있도록 확률 높이기)
                    addStockLine(stocks: stocks)
                    // iMessage 소리 재생
                    soundManager.play(sound: .iMessage, volume: 1.0)
                }
            }) {
                Image(systemName: "arrow.up.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(.green)
            }
            Spacer().frame(width: 20)
        }
    }
    
    // 양봉 음봉 추가 함수
    func addStockLine(stocks:[(Bool, Double, Double, Double, Double)]){
        let randomHeightOfBox = Double.random(in: 0.3..<1.0) * 100.0
        let randomHeightOfBox2 = Double.random(in: 0.1..<0.6) * 100.0
        let randomHeightOfUpLine = Double.random(in: 0.3..<1.0) * 10.0
        let randomHeightOfDownLine = Double.random(in: 0.3..<1.0) * 10.0
        let randomIntToDecidePlus = Int.random(in: 1...10)
        
        let isPlus:Bool = randomIntToDecidePlus <= 6
        let aboveHeight:Double = isPlus ? (nowHeight + randomHeightOfBox/2) : (nowHeight - randomHeightOfBox2/2)
        
        let stock:(Bool, Double, Double, Double, Double) = (isPlus, isPlus ? randomHeightOfBox : randomHeightOfBox2, randomHeightOfUpLine, randomHeightOfDownLine, aboveHeight)
        
        self.stocks.append(stock)
        if(stockLength.count >= 24){
            self.stocks.removeFirst()
        }
        
        
        if(stockLength.count < 24){
            self.stockLength.append(self.index)
            self.index += 1
        }
        nowHeight = aboveHeight
    }
}
