// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HoardMap.Persistence",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HoardMap.Persistence",
            type: .dynamic,
            targets: ["HoardMap.Persistence"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HoardMap.Persistence", path: "Sources/HoardMap.Persistence", resources: [.process("Model.xcdatamodeld")]),
        .testTarget(
            name: "HoardMap.PersistenceTests",
            dependencies: ["HoardMap.Persistence"]
        ),
    ]
)
