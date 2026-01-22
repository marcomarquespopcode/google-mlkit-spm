// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MLKitBarcodeScanning",
            targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.4.0"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "10.1.0"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "5.0.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30910.0")),
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(
            name: "MLImage",
            path: "Sources/MLImage/MLImage.framework"
        ),
        .binaryTarget(
            name: "MLKitBarcodeScanning",
            path: "Sources/MLKitBarcodeScanning/MLKitBarcodeScanning.framework"
        ),
        .binaryTarget(
            name: "MLKitVision",
            path: "Sources/MLKitVision/MLKitVision.framework"
        ),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleToolboxForMac.xcframework.zip", checksum: "a18406849686b594ca5f11dffd2c68d6287c8130a48e2fb06495a2ea2acbc771"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleUtilitiesComponents.xcframework.zip", checksum: "bf260b6d20bdea8509bbaa3a5a2b1c79afd255bc448a38db7d6c79483e448c97"),
        .target(
            name: "Common",
            dependencies: [
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
