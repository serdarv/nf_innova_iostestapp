// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RepoFeature",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RepoFeature",
            targets: ["RepoFeature"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../CoreNetworking"), // Adjust the path as needed
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RepoFeature",
            dependencies: ["CoreNetworking"]
        ),
        .testTarget(
            name: "RepoFeatureTests",
            dependencies: ["RepoFeature"]
        ),
    ]
)
