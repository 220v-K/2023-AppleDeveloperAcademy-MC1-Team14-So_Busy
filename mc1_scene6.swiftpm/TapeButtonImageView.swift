//
//  TapeButtonImageView.swift
//  mc1_scene6
//
//  Created by sei on 2023/03/30.
//

import SwiftUI
import SDWebImageWebPCoder

struct TapeButtonImageView: View {
//    @ObservedObject var imageLoader: SDImageLoader
//    @State var image: UIImage = UIImage()
    
//    init(withURL url: String) {
//        imageLoader =
//    }
    
    var body: some View {
        let imageUrl = Bundle.main.url(forResource: "Frame_right", withExtension: "webp")
        
        let webPImage = UIImage.sd_image(with: try? Data(contentsOf: imageUrl!))
        
        Image(uiImage: webPImage!)
            .resizable()
            .scaledToFit()
    }
    
}
