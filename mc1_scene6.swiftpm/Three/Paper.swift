//
//  Paper.swift
//  
//
//  Created by sei on 2023/03/30.
//
import Foundation

// Cookie Model...
struct Paper: Identifiable {
    var id = UUID()
    var isAdded: Bool = false
    var position: CGSize
}

