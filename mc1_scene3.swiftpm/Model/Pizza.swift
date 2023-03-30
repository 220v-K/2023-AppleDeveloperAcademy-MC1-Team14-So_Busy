//
//  Pizza.swift
//  mc1_scene3
//
//  Created by sei on 2023/03/29.
//

import SwiftUI

// Pizza model and sample pizzas
struct Pizza: Identifiable {
    var id = UUID()
    var breadName: String
    var toppings: [Topping] = []
}


