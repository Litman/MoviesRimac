//
//  SecurityRepository.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import KeychainSwift

public protocol SecurityRepo {
    
    var token: String { get set }
    var refreshToken: String { get set }
    var clientId: String {get set}
    var clientSecret: String {get set}
    func clear()
    
}

public struct SecurityRepository: SecurityRepo {
    
    // MARK: - Singleton
    public static var shared = SecurityRepository()
    
    // MARK: - SecurityRepo
    public var token: String {
        get {
            return KeychainSwift().get(Constants.Security.token) ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: Constants.Security.token)
        }
    }
    
    public var refreshToken: String {
        get {
            return KeychainSwift().get(Constants.Security.refreshToken) ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: Constants.Security.refreshToken)
        }
    }
    
    public var clientSecret: String {
        get {
            return KeychainSwift().get(Constants.Security.clientSecret) ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: Constants.Security.clientSecret)
        }
    }
    
    public var clientId: String {
        get {
            return KeychainSwift().get(Constants.Security.clientId) ?? ""
        }
        set {
            KeychainSwift().set(newValue, forKey: Constants.Security.clientId)
        }
    }
    
    public func clear() {
        KeychainSwift().delete(Constants.Security.token)
        KeychainSwift().delete(Constants.Security.refreshToken)
        KeychainSwift().delete(Constants.Security.clientId)
        KeychainSwift().delete(Constants.Security.clientSecret)
    }
    
}
