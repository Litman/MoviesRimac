//
//  Double+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import Foundation
import UIKit

public extension Double {
    
    static let automatic: Double = Double.greatestFiniteMagnitude-1 // Subtracting one to reduce posibility of dupliaction
    static let none: Double = -automatic
    
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}
