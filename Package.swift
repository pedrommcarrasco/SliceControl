// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
let package = Package(
    name: "SliceControl",
    platforms: [
       .iOS(.v11),
    ],
    products: [
        .library(
            name: "SliceControl",
            targets: ["SliceControl"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SliceControl",
            dependencies: [],
            path: "SliceControl"),
    ]
)
