//
//  BackgroundView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct BackgroundView: View {
    let name: String
    
    var body: some View {
        let imageUrl = Bundle.main.url(forResource: name, withExtension: "webp")
        
        let webPImage = UIImage.sd_image(with: try? Data(contentsOf: imageUrl!))
        
        Image(uiImage: webPImage!)
            .resizable()
            .scaledToFit()
    }
}
