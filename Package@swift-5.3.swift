// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BluetoothLinux",
    products: [
        .library(
            name: "BluetoothLinux",
            type: .static,
            targets: ["BluetoothLinux"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/DrAma999/Bluetooth.git",
            .branch("master")
        )
    ],
    targets: [
        .target(
            name: "BluetoothLinux",
            dependencies: [
                .product(
                    name: "Bluetooth",
                    package: "Bluetooth"
                ),
                .product(
                    name: "BluetoothHCI",
                    package: "Bluetooth"
                ),
                "CSwiftBluetoothLinux"
            ]
        ),
        .target(
            name: "CSwiftBluetoothLinux"
        ),
        .target(
            name: "CSwiftBluetoothLinuxTest"
        ),
        .testTarget(
            name: "BluetoothLinuxTests",
            dependencies: [
                "BluetoothLinux",
                "CSwiftBluetoothLinuxTest"
            ]
        )
    ]
)
