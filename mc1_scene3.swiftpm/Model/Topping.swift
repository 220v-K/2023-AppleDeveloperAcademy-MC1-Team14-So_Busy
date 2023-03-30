//
//  Topping.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

// Topping Model...
struct Topping: Identifiable {
    var id = UUID()
    var toppingName: String
    var isAdded: Bool = false
    var randomToppingPosition: [CGSize] = []
}
