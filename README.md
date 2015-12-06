# Swift3D
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/adriankrupa/Swift3D/master/LICENSE)
![CocoaPods](https://img.shields.io/cocoapods/v/Swift3D.svg)
[![GitHub release](https://img.shields.io/github/release/adriankrupa/Swift3D.svg)](https://github.com/adriankrupa/Swift3D/releases)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/adriankrupa/swift3D.svg?branch=master)](https://travis-ci.org/adriankrupa/swift3D)

A set of Swift functions useful fro 3D programming. It expand common mathematical functions on SIMD data types. There are also handy functions for projection matrices, quaternions, matrices and vectors conversions. Everything is tested using [glm](https://github.com/g-truc/glm).


# Setup #

## Using [Carthage](https://github.com/Carthage/Carthage)

Add `github "adriankrupa/Swift3D" ~> 0.1.0` to your `Cartfile` and run `carthage update`. If unfamiliar with Carthage then checkout their [Getting Started section](https://github.com/Carthage/Carthage#getting-started)

## Using [cocoapods](http://cocoapods.org/) version 0.36.x or greater

Add `pod 'Swift3D'` to your `Podfile` and run `pod install`. Add `use_frameworks!` to the end of the `Podfile`. Requires cocoapod version 0.36.x or greater.

## Using `git submodule`

1. If you are using git then add Dollar as a submodule using `git submodule add https://github.com/adriankrupa/Swift3D.git`. If not using git download the project using `git clone https://github.com/adriankrupa/Swift3D.git` in your project folder.
2. Open the Swift3D folder. Drag Swift3D.xcodeproj, inside the Swift3D folder, into the file navigator of your Xcode project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. In the tab bar at the top of that window, open the "Build Phases" panel.
5. Expand the "Link Binary with Libraries" group, and add Swift3D.framework.
6. In your project file `import Swift3D` and you can call all of the helper functions.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/adriankrupa/swift3d/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/adriankrupa/swift3d/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

