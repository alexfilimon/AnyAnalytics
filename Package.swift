// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnyAnalytics",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AnyAnalytics",
            targets: ["AnyAnalytics"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnyAnalytics",
            dependencies: [],
            path: "Analytics"
        ),
        .testTarget(
            name: "AnalyticsTests", 
            dependencies: ["AnyAnalytics"],
            path: "AnalyticsTests"
        )
    ],
    swiftLanguageVersions: [.v5],
    cxxLanguageStandard: .gnucxx11
)
