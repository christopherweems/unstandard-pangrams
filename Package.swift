// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unstandard-pangrams",
    products: [
        .library(
            name: "Pangrams",
            targets: ["Pangrams"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/gitmcfly/lc-locale.git", from: "0.1.0"),
        
    ],
    targets: [
        .target(
            name: "Pangrams",
            dependencies: [
                .product(name: "lc-locale", package: "lc-locale"),
            ],
            resources: [
                .copy("English.txt"),
                
            ]
        ),
        
        .testTarget(
            name: "PangramTests",
            dependencies: ["Pangrams"]),
        
    ]
)
