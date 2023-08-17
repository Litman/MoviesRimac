//
//  BaseModelProtocol.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 14/08/23.
//

import Foundation

protocol BaseModelProtocol {
    
    var success: Bool? {get set}
    var errors: [ErrorModel]? {get set}
    var errorModel: ErrorModel {get set}
    var isSuccess: Bool {get set}
    
}

extension BaseModelProtocol {
    
    public var isSuccess: Bool {
        guard let success = success, success == true else {
            return false
        }
        return true
    }
    
    public var errorModel: ErrorModel {
        get{
            guard let errors = errors else {
                return ErrorModel()
            }
            return errors.first ?? ErrorModel()
        }
    }
    
}
