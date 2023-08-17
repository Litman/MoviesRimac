//
//  UIImageView+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 15/08/23.
//

import UIKit

extension UIImageView {
    
    public func apply(tintColor color: UIColor) {
        if image != nil {
            image = image?.withRenderingMode(.alwaysTemplate)
            tintColor = color
        }
    }
    
}
