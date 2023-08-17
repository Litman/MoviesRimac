//
//  RestApiImage.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import UIKit

public protocol RestApiImage {
    
    var image: UIImage { get set }
    var name: String { get set }
    var fileName: String { get set }
    
    func serialized() -> (data:Data, mimeType:String)
    
}
