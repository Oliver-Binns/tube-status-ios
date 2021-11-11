// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TFLAPI",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7),
        .macOS(.v11),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "TFLAPI", targets: ["TFLAPI"])
    ],
    targets: [
        .target(name: "TFLAPI", dependencies: []),
        .testTarget(name: "TFLAPITests", dependencies: ["TFLAPI"])
    ]
)
