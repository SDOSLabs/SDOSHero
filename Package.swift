// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SDOSHero",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SDOSHero",
            targets: ["SDOSHero"])
    ],
    dependencies: [
        .package(url: "https://github.com/HeroTransitions/Hero.git", .upToNextMajor(from: "1.5.0")),
    ],
    targets: [
        .target(
            name: "SDOSHero",
            dependencies: [
                "Hero",
            ],
            path: "src"
        ),
    ]
)
