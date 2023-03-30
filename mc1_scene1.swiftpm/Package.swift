// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "mc1_scene1",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "mc1_scene1",
            targets: ["AppModule"],
            bundleIdentifier: "com.ung.Scrumdinger",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .butterfly),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", .branch("master"))
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "sdwebimageswiftui")
            ],
            path: "."
        )
    ]
)
