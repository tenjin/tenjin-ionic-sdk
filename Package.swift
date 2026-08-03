// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IonicCapacitorTenjin",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "IonicCapacitorTenjin",
            targets: ["IonicCapacitorTenjinPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", "7.0.0"..<"9.0.0"),
        .package(url: "https://github.com/tenjin/tenjin-ios-sdk.git", exact: "1.18.0")
    ],
    targets: [
        .target(
            name: "TenjinImplementation",
            dependencies: [
                .product(name: "TenjinSDK", package: "tenjin-ios-sdk")
            ],
            path: "ios/Sources/TenjinImplementation",
            publicHeadersPath: "include"),
        .target(
            name: "IonicCapacitorTenjinPlugin",
            dependencies: [
                "TenjinImplementation",
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/IonicCapacitorTenjinPlugin"),
        .testTarget(
            name: "IonicCapacitorTenjinPluginTests",
            dependencies: ["IonicCapacitorTenjinPlugin"],
            path: "ios/Tests/IonicCapacitorTenjinPluginTests")
    ]
)
