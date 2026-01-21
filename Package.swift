// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "MLKitBarcodeScanning",
            targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.4.0"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "10.1.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "8.1.0"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "5.0.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30910.0")),
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLImage", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/MLImage.xcframework.zip", checksum: "d262dfbedc1e0c23f71e2e62b80f16ec1b1557796014bf0696413a2413e4c3dc"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/MLKitBarcodeScanning.xcframework.zip", checksum: "6141645a1db5a1f5d293fbc9f5032560a9f2c20da649ee96cd5c57a0872c1597"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/MLKitCommon.xcframework.zip", checksum: "01acbd061202386b34e426d83106b214dcda16c9fd1958cefe4abcf0be7dd728"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/MLKitVision.xcframework.zip", checksum: "b7219868c14cbbeb3cc5644d208b767eefe08e1be7fb054b9efb069dfd33f778"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/GoogleToolboxForMac.xcframework.zip", checksum: "9ae7fcf8127cecbe6d9d980c688303ea643da8c4605109b5bd312a10ddd8a45d"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/GoogleUtilitiesComponents.xcframework.zip", checksum: "d42ecc0ec087793891adf7bb81fdb5653ca36d21853321bfb24fcc398572b020"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/4.0.0/Protobuf.xcframework.zip", checksum: "df07f834be4e3f358489419668c077a7be8f7228eeb5ba5ae9ce2e2a58101bc9"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
