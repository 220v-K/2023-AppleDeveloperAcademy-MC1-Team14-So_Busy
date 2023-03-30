//
//  ResourcesName.swift
//  playgroundtest
//
//  Created by sei on 2023/03/30.
//

import Foundation

enum Frame {
    static let body = "Frame_left"
    enum ButtonClicked {
        static let rew = "Frame_right_RewClick"
        static let six = "Frame_right_6Click"
        static let five = "Frame_right_5Click"
        static let four = "Frame_right_4Click"
        static let three = "Frame_right_3Click"
        static let two = "Frame_right_2Click"
        static let one = "Frame_right_1Click"
        static let none = "Frame_right"
    }
}

enum BackgroundImage {
    static let one = ""
    static let three = "bg_3"
    static let four = "bg_4"
}

enum Video {
    static let normal = "six"
    static let rew = "six_rew"
}

enum PaperImage: String, CaseIterable {
    case paper_1, paper_2, paper_3, paper_4, paper_5, paper_6
}
