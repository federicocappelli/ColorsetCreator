//
//  NSColor+RGB.swift
//  ColorsetCreator
//
//  Created by Federico Cappelli on 03/02/2018.
//  Copyright (c) 2018 Federico Cappelli. All rights reserved.
//

import Cocoa

public extension NSColor {
    var redValue: CGFloat{ return CIColor(color: self)!.red }
    var greenValue: CGFloat{ return CIColor(color: self)!.green }
    var blueValue: CGFloat{ return CIColor(color: self)!.blue }
    var alphaValue: CGFloat{ return CIColor(color: self)!.alpha }
}
