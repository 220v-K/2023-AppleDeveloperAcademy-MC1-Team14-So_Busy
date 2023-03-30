//
//  SceneSixView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI

struct SceneSixView: View {
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                VideoView(videoNames: ["video2", "video"])
                ScaledToFitImage(fileName: "Frame_left")
            }
            ScaledToFitImage(fileName: "Frame_right_6Click")
        }
        .ignoresSafeArea()
    }
}


struct SceneSixView_Previews: PreviewProvider {
    static var previews: some View {
        SceneSixView()
    }
}
