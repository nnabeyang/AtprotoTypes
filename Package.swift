// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "AtprotoTypes",
	platforms: [.iOS(.v16), .macOS(.v13)],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "AtprotoTypes",
			targets: ["AtprotoTypes"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/swift-libp2p/swift-bases.git", .upToNextMajor(from: "0.0.1")),
		.package(
			url: "https://github.com/nnabeyang/GermConvenience.git",
			revision: "2d26051414ad5e876745ec1caee14aaece55a41e"
		),
		.package(
			url: "https://github.com/apple/swift-crypto.git",
			.upToNextMajor(from: "4.2.0")),
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "AtprotoTypes",
			dependencies: [
				.product(name: "Base32", package: "swift-bases"),
				"GermConvenience",
				.product(name: "Crypto", package: "swift-crypto"),
			]
		),
		.testTarget(
			name: "AtprotoTypesTests",
			dependencies: ["AtprotoTypes"]
		),
	]
)
