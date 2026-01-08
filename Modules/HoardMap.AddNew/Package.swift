// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HoardMap.AddNew",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HoardMap.AddNew",
            targets: ["HoardMap.AddNew"]),
    ],
    dependencies: [.package(path: "HoardMap.Persistence")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HoardMap.AddNew",
            dependencies: ["HoardMap.Persistence"]),
        .testTarget(
            name: "HoardMap.AddNewTests",
            dependencies: ["HoardMap.AddNew"]
        ),
    ]
)
