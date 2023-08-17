//
//  CGFloat+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 15/08/23.
//

import UIKit

extension CGFloat {
    
    public static let automatic: CGFloat = CGFloat.greatestFiniteMagnitude - 1 // Subtracting one to reduce posibility of dupliaction
    public static let none: CGFloat = -automatic
    
    public var numberValue:NSNumber {
        return NSNumber(value: doubleValue)
    }
    
    public var doubleValue:Double {
        return Double(self)
    }
    
    static var tinySpacing: CGFloat   = 4                    // 4
    static var smallSpacing: CGFloat  = tinySpacing*2
    static var mediumSpacing: CGFloat = tinySpacing*3
    static var largeSpacing: CGFloat  = tinySpacing*4
    static var sbShadowRadius: CGFloat = .smallSpacing
    
}

extension Float {

    public var cgFloatValue:CGFloat {
        return CGFloat(self)
    }

}

extension Double {

    public var cgFloatValue:CGFloat {
        return CGFloat(self)
    }

}
