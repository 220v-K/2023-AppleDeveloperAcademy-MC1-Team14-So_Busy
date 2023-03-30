//
//  TapeImageView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI
import SDWebImageWebPCoder

struct TapeImageView: View {
    let type: TapeImage
    
    var body: some View {
        let imageUrl = Bundle.main.url(forResource: type.rawValue, withExtension: "webp")
        
        let webPImage = UIImage.sd_image(with: try? Data(contentsOf: imageUrl!))
        
        Image(uiImage: webPImage!)
            .resizable()
            .scaledToFit()
    }
    
}
