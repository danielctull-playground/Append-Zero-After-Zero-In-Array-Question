// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AppendZeroAfterZeroInArrayQuestion",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "AppendZeroAfterZeroInArrayQuestion", targets: ["AppendZeroAfterZeroInArrayQuestion"]),
    ],
    targets: [
        .target(name: "AppendZeroAfterZeroInArrayQuestion"),
        .testTarget(name: "AppendZeroAfterZeroInArrayQuestionTests", dependencies: ["AppendZeroAfterZeroInArrayQuestion"]),
    ]
)
