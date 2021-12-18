// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ghgungnircore",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ghgungnircore",
            targets: ["ghgungnircore"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ghgungnircore",
            dependencies: []),
        .testTarget(
            name: "ghgungnircoreTests",
            dependencies: ["ghgungnircore"]),
    ]
)
