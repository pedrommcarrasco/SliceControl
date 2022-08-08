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
