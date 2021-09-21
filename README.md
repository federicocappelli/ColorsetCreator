# ColorsetCreator

[![Version](https://img.shields.io/cocoapods/v/ColorsetCreator.svg?style=flat)](https://cocoapods.org/pods/ColorsetCreator)
[![License](https://img.shields.io/cocoapods/l/ColorsetCreator.svg?style=flat)](https://cocoapods.org/pods/ColorsetCreator)
[![Platform](https://img.shields.io/cocoapods/p/ColorsetCreator.svg?style=flat)](https://cocoapods.org/pods/ColorsetCreator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

macOS 10.13+

## Installation

ColorsetCreator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ColorsetCreator'
```

## Usage

```
let colorsTest = [
            Color(name: "Color1", nsColor: NSColor.red),
            Color(name: "Color2", nsColor: NSColor.black),
            Color(name: "Color3", nsColor: NSColor(deviceRed: 50/255, green: 168/255, blue: 82/255, alpha: 1.0)),
            Color(name: "Color4", nsColor: NSColor.green),
        ]
        
let destinationFolderURL = ...
do {
	try ColorsetCreator.generateXCAsset(fromColorsWithNames: colorsTest,
                                                inFolder: destinationFolderURL,
                                                assetName: "ColorsetCreatorTest",
                                                force: true)
} catch {
	print("Error: \(error)")
}
```


## Author

Federico Cappelli (info@federicocappelli.net)

## License

ColorsetCreator is available under the MIT license. See the LICENSE file for more info.
