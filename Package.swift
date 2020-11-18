// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftConvenienceExtensions",
    products: [
        .library(
            name: "SwiftConvenienceExtensions",
            targets: ["SwiftConvenienceExtensions"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftConvenienceExtensions",
            dependencies: []),
        .testTarget(
            name: "SwiftConvenienceExtensionsTests",
            dependencies: ["SwiftConvenienceExtensions"]),
    ]
)
