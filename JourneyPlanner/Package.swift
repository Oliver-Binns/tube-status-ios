// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JourneyPlanner",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7),
        .macOS(.v11),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "JourneyPlanner", targets: ["JourneyPlanner"]),
    ],
    dependencies: [
        .package(name: "TFLAPI", path: "../TFLAPI")
    ],
    targets: [
        .target(name: "JourneyPlanner", dependencies: ["TFLAPI"]),
        .testTarget(name: "JourneyPlannerTests", dependencies: ["JourneyPlanner"]),
    ]
)
