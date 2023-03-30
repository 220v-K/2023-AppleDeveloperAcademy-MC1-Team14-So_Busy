//
//  Cookie.swift
//  
//
//  Created by sei on 2023/03/30.
//
import Foundation

// Cookie Model...
struct Cookie: Identifiable {
    var id = UUID()
    var isAdded: Bool = false
    var position: CGPoint
    var x: CGFloat {
        position.x
    }
    var y: CGFloat {
        position.y
    }
}

