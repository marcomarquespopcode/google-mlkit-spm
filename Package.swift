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
        .binaryTarget(name: "MLImage", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLImage.xcframework.zip", checksum: "e5e2148cc9ef8e01f0fc1fcb7e506b90a1d8c486bc09da60a8c4cf7a66f7219c"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitBarcodeScanning.xcframework.zip", checksum: "0e1ecd3f5c627004656ae493c20547a52a8742ccdfbf09de8b2ba7de1c9d9791"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitCommon.xcframework.zip", checksum: "bff8f429c1b5769620735a870c1af1304e3ac9193877ea8140dec386a73bbed8"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitVision.xcframework.zip", checksum: "eb92794ee786161dddcc458361894226b6548e52dba3864059cecc3a13221cba"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleToolboxForMac.xcframework.zip", checksum: "1e218dcb4e9dc9509d801bce52c4a8de7c7d8f758f4794e906084145312c8b56"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleUtilitiesComponents.xcframework.zip", checksum: "8ef8188a3ab43373b9d43e2c8e52af659fc06a2723ba002d4bdbe8182163d69a"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/Protobuf.xcframework.zip", checksum: "08ac068053f133d31a8943b72ab5451cef2772751e6abf0bd982675f0f6a07ab"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
