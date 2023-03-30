//
//  Paper.swift
//  
//
//  Created by sei on 2023/03/30.
//
import Foundation

// Paper Model
struct Paper: Identifiable {
    var id = UUID()
    var name: String
    var isAdded: Bool = false
    var position: CGPoint
    var degree: Double
    var x: CGFloat { position.x }
    var y: CGFloat { position.y }
}

