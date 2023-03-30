//
//  ScaledToFitImage.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI

struct ScaledToFitImage: View {
    let fileName: String
    var body: some View {
        Image(fileName)
            .resizable()
            .scaledToFit()
    }
}
