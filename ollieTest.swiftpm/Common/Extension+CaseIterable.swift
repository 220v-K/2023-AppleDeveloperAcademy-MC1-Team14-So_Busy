//
//  File.swift
//  
//
//  Created by sei on 2023/03/31.
//

import Foundation

extension CaseIterable {
    static func randomElement() -> AllCases.Element {
        guard Self.allCases.count > 0 else {
            fatalError("There must be at least one case in the enum")
        }
        return Self.allCases.randomElement()!
    }
}
