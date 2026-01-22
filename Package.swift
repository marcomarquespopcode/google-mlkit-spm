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
        .binaryTarget(name: "MLImage", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLImage.xcframework.zip", checksum: "e6b9f7c4c124ab36397a655a54d2a3eba1f9649094082e416007c65867358107"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitBarcodeScanning.xcframework.zip", checksum: "2399961079a33d99a9773da10cde8390d517cd7a480b3b4efc6bd86a9bc0614a"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitCommon.xcframework.zip", checksum: "c33f850174dc69c0c775f7b4d28350ace682d4fdbc9a95187dce4f0ef2f58917"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/MLKitVision.xcframework.zip", checksum: "190b995f8dcee007841d0f67697953a54caf095cc5ae7503db0ce84e2c65d98f"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleToolboxForMac.xcframework.zip", checksum: "08f1369eed51d45f3815afaf0fa5959b95603dcdaa899017875bae10fac9d4b5"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/GoogleUtilitiesComponents.xcframework.zip", checksum: "fb444fecbbd64db61ce8c0eb1b9850002eec1856635f1412d99e3004b1897dc8"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/marcomarquespopcode/google-mlkit-spm/releases/download/1.0.5/Protobuf.xcframework.zip", checksum: "d4ffb45930a40dc5383c299725113cd81a6e417d39757c1525bc730de4f55c54"),
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
