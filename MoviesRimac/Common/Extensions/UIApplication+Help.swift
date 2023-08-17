//
//  UIApplication+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import UIKit


extension UIApplication {
    
    var currentWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
}
