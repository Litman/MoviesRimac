//
//  ErrorModel.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 14/08/23.
//

import Foundation

public struct ErrorModel: Codable {
    var title: String?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case message
    }
    
    init() {
        self.title = "Lo sentimos"
        self.message = "Presentamos inconvenientes."
    }
    
}
