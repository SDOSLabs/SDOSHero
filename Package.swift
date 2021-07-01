// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SDOSHero",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "SDOSHero",
            targets: ["SDOSHero"])
    ],
    dependencies: [
        .package(url: "https://github.com/HeroTransitions/Hero.git", .upToNextMajor(from: "1.6.0")),
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
