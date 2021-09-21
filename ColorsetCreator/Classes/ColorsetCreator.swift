//
//  ColorsetCreator.swift
//  ColorsetCreator
//
//  Created by Federico Cappelli on 03/02/2018.
//  Copyright (c) 2018 Federico Cappelli. All rights reserved.
//

import AppKit

public enum ColorsetCreatorError: Error {
    case internalError
    case destinationFolderAlreadyPresent
}

public struct Color {
    public var name: String
    public var nsColor: NSColor
    
    public init(name: String, nsColor: NSColor) {
        self.name = name
        self.nsColor = nsColor
    }
    
    func jsonStructure() throws -> String? {
        let aColorDic: [String : Any] = [
            "universal": "idiom",
            "color" : ["color-space" : "srgb",
                       "components" : [
                        "red" : "\(self.nsColor.redValue)",
                        "alpha" : "\(self.nsColor.alphaValue)",
                        "blue" : "\(self.nsColor.blueValue)",
                        "green" : "\(self.nsColor.greenValue)"
                       ]]
        ]
        let colorsArray = [aColorDic]
        let resultDic: [String : Any] = ["info": [ "version": 1, "author": "xcode"],
                                         "colors": colorsArray
        ]
        
        let theJSONData = try JSONSerialization.data(withJSONObject: resultDic, options: [])
        let theJSONText = String(data: theJSONData, encoding: .utf8)
        return theJSONText
    }
}

public class ColorsetCreator {
    
    static let componentName = "ColorsetCreator"
    static let domain = "com.federicocappelli.colorsetcreator"
    
    /// Generates an assets catalog (.xcasset) containing all the `Color`s specified in the provided array
    /// - Parameters:
    ///   - colors: An array of `Color`s
    ///   - folderURL: Destination folder for the asset catalog
    ///   - assetName: Asset catalog name
    ///   - force: Override all the pre-existing files with the same name, if any.
    /// - Throws: `ColorsetCreatorError`s or underlying errors
    public static func generateXCAsset(fromColorsWithNames colors: [Color],
                                       inFolder folderURL: URL,
                                       assetName: String,
                                       force: Bool) throws {
        let folderName = "\(assetName).xcassets"
        let completeURL = folderURL.appendingPathComponent(folderName)
        
        if FileManager.default.fileExists(atPath: completeURL.path, isDirectory: nil) {
            if force {
                try FileManager.default.removeItem(atPath: completeURL.path)
            }
            else {
                throw ColorsetCreatorError.destinationFolderAlreadyPresent
            }
        }
        
        //Create the folder structure
        try FileManager.default.createDirectory(atPath: completeURL.path,
                                                withIntermediateDirectories: false,
                                                attributes: nil)
        
        //Create root Contents.json
        try ColorsetCreator.rootTemplate.write(toFile: completeURL.appendingPathComponent("Contents.json").path,
                                           atomically: true,
                                           encoding: .utf8)
        
        //Create folder and json foreach color
        for color in colors {
            //Create .colorset folder
            let colorsetFolderUrl = completeURL.appendingPathComponent("\(color.name).colorset")
            try FileManager.default.createDirectory(atPath: colorsetFolderUrl.path,
                                                    withIntermediateDirectories: false,
                                                    attributes: nil)
            //create Content.json
            var contentJson = ColorsetCreator.template
            contentJson = contentJson.replacingOccurrences(of: "$a", with: "\(color.nsColor.alphaValue)")
            contentJson = contentJson.replacingOccurrences(of: "$b", with: "\(color.nsColor.blueValue)")
            contentJson = contentJson.replacingOccurrences(of: "$g", with: "\(color.nsColor.greenValue)")
            contentJson = contentJson.replacingOccurrences(of: "$r", with: "\(color.nsColor.redValue)")
            try contentJson.write(toFile: colorsetFolderUrl.appendingPathComponent("Contents.json").path,
                                  atomically: true,
                                  encoding: .utf8)
        }
    }
    
    static let template = """
        {
          "colors" : [
            {
              "color" : {
                "color-space" : "srgb",
                "components" : {
                  "alpha" : "$a",
                  "blue" : "$b",
                  "green" : "$g",
                  "red" : "$r"
                }
              },
              "idiom" : "universal"
            },
            {
              "appearances" : [
                {
                  "appearance" : "luminosity",
                  "value" : "dark"
                }
              ],
              "color" : {
                "color-space" : "srgb",
                "components" : {
                  "alpha" : "$a",
                  "blue" : "$b",
                  "green" : "$g",
                  "red" : "$r"
                }
              },
              "idiom" : "universal"
            }
          ],
          "info" : {
            "author" : "xcode",
            "version" : 1
          }
        }
        """
    
    static let rootTemplate = """
        {
          "info" : {
            "author" : "xcode",
            "version" : 1
          }
        }
        """
}
