// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-optic-parser",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Optic Parser",
            targets: ["Optic Parser"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-either.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-optic.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-parser.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Optic Parser",
            dependencies: [
                .product(name: "Either", package: "swift-either"),
                .product(name: "Optic", package: "swift-optic"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "Parser Map", package: "swift-parser"),
            ]
        ),
        .testTarget(
            name: "Optic Parser Tests",
            dependencies: [
                .target(name: "Optic Parser"),
                .product(name: "Either", package: "swift-either"),
                .product(name: "Optic", package: "swift-optic"),
                .product(name: "Parser", package: "swift-parser"),
                .product(name: "Parser Map", package: "swift-parser"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
