// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UndergroundStatus",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7),
        .macOS(.v11),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "UndergroundStatus", targets: ["UndergroundStatus"])
    ],
    dependencies: [
        .package(name: "BaseUI", path: "../BaseUI"),
        .package(name: "TFLAPI", path: "../TFLAPI")
    ],
    targets: [
        .target(name: "UndergroundStatus", dependencies: ["BaseUI", "TFLAPI"]),
        .testTarget(name: "UndergroundStatusTests", dependencies: ["UndergroundStatus"])
    ]
)
