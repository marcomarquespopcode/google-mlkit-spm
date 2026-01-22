// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v14)],
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
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleToolboxForMac.xcframework.zip", checksum: "637f9f3f9af4131133350b4de1636d232d6f64bc481eb458c499a260c2887d92"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleUtilitiesComponents.xcframework.zip", checksum: "036a97df6265fe0d6c0cd0d75d99e5fec0ae788672ae4733923092c61e9e93f1"),
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
