//
//  RestApi.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import UIKit

public enum ResponseApi<T> {
    
    case success(T)
    case failure(ServiceError)
}

public enum HTTPVerb {
    
    case connect
    case delete
    case get
    case head
    case options
    case patch
    case post
    case put
    case trace
}

public protocol RestApi: class {
    
    var authenticatedHeaders: [String : String] { get }
    
    func request<T: Decodable>(of type: T.Type,
                               url: String,
                               verb: HTTPVerb,
                               parameters: [String: Any]?,
                               headers: [String: String]?,
                               completion: @escaping (ResponseApi<T>) -> Void)
    
    func download(imageAt url: String,
                  headers: [String:String]?,
                  needsAuthentication: Bool,
                  completion: @escaping (ResponseApi<UIImage>) -> Void)

    
    func requestJSON(url: String,
                     verb: HTTPVerb,
                     parameters: [String: Any]?,
                     headers: [String: String]?,
                     needsAuthentication: Bool,
                     completion: @escaping (ResponseApi<Any>) -> Void)
    
}


extension RestApi {
    
    //TODO
    // MARK: - Properties
    public var baseURL:String {
        if let url = Bundle.main.object(forInfoDictionaryKey: Constants.UrlKey) as? String {
            print("********* \(url)")
            return url
        }
        return ""
    }
    
    public var headers: [String : String] {
        return ["Content-Type":"Application/json",
                "ChannelCode":"IOS",
                "Authorization": ""]

    }
    
    public var requestLoginTokenHeader : [String: String] {
        return ["Accept" : "application/json",
            "Content-Type" : "application/x-www-form-urlencoded"]
    }
    
    public var requestRefreshTokenHeader : [String: String] {
        return ["Content-Type" : "application/x-www-form-urlencoded"]
    }
    
}

