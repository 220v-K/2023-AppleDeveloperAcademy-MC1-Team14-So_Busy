//
//  TapleImageView.swift
//  Supeasy_blackboard
//
//  Created by 조용현 on 2023/03/30.
//

import SwiftUI
import SDWebImage

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

