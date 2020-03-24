// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "LayoutKit",
    products: [
        .library(
            name: "LayoutKit",
            targets: ["LayoutKit"]
        ),
    ],
    dependencies: [
        .package(
            url: "git@github.com:technogen-gg/NameKit.git",
            .upToNextMajor(from: Version(0, 0, 1))
        ),
    ],
    targets: [
        .target(
            name: "LayoutKit",
            dependencies: [
                "NameKit",
            ]
        ),
        .testTarget(
            name: "LayoutKit.Test",
            dependencies: ["LayoutKit"]
        ),
    ]
)
