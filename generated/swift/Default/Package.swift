// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Default",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "Default",
            targets: ["Default"]),
    ],
    dependencies: [
      
        .package(url: "https://github.com/firebase/data-connect-ios-sdk", from: "11.3.0-beta"),
      
    ],
    targets: [
        .target(
            name: "Default",
            dependencies: [
              .product(name:"FirebaseDataConnect", package:"data-connect-ios-sdk")
            ],
            path: "Sources"
        )
    ]
)
