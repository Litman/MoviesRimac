//
//  UIColor+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import Foundation


import UIKit

extension UIColor {
    
    // MARK: - Private
    fileprivate class func colorComponent(from str:String, start:Int, length:Int) -> CGFloat {
        let range = str.index(str.startIndex, offsetBy: start)..<str.index(str.startIndex, offsetBy: start+length)
        let substring = String(str[range])
        let fullHex = length == 2 ? substring : "\(substring)\(substring)"
        var hexComponent:CUnsignedInt = 0
        Scanner(string: fullHex).scanHexInt32(&hexComponent)
        return CGFloat(hexComponent)/255.0
    }
    
    public func with(alpha newAlpha: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0
        var saturation: CGFloat = 1.0
        var brightness: CGFloat = 1.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: newAlpha)
    }
    
    // MARK: - Lifecycle
    public convenience init(hexString:String, alpha:CGFloat = -1) {
        let colorString = hexString.replacingOccurrences(of: "#", with: "")
        var alphaColor, red, blue, green:CGFloat
        
        switch(colorString.count) {
        case 3: // #RGB
            alphaColor = 1.0
            red   = UIColor.colorComponent(from: colorString, start: 0, length: 1)
            green = UIColor.colorComponent(from: colorString, start: 1, length: 1)
            blue  = UIColor.colorComponent(from: colorString, start: 2, length: 1)
            break;
        case 4: // #ARGB
            alphaColor = UIColor.colorComponent(from: colorString, start: 0, length: 1)
            red   = UIColor.colorComponent(from: colorString, start: 1, length: 1)
            green = UIColor.colorComponent(from: colorString, start: 2, length: 1)
            blue  = UIColor.colorComponent(from: colorString, start: 3, length: 1)
            break;
        case 6: // #RRGGBB
            alphaColor = 1.0
            red   = UIColor.colorComponent(from: colorString, start: 0, length: 2)
            green = UIColor.colorComponent(from: colorString, start: 2, length: 2)
            blue  = UIColor.colorComponent(from: colorString, start: 4, length: 2)
            break;
        case 8: // #AARRGGBB
            alphaColor = UIColor.colorComponent(from: colorString, start: 0, length: 2)
            red   = UIColor.colorComponent(from: colorString, start: 2, length: 2)
            green = UIColor.colorComponent(from: colorString, start: 4, length: 2)
            blue  = UIColor.colorComponent(from: colorString, start: 6, length: 2)
            break;
        default:
            alphaColor = 1.0
            red   = 0
            green = 0
            blue  = 0
            break;
        }
        if (alpha != -1) {
            alphaColor = alpha
        }
        self.init(red:red, green:green, blue:blue, alpha:alphaColor)
    }
    
    
    //MARK:  Medium Grey
    class var mediumGrey: UIColor {
        return UIColor(hexString: "#767676")
    }
}
