//
//  ServiceError.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation


public struct ServiceError: Error {
    
    public enum Kind: CustomStringConvertible {
        
        case badRequest
        case general
        case invalidResponse
        case notInternetConnection
        case requestCancelled
        case serviceUnavailable
        case timeout
        case conflict
        case tokenExpired
        
        public init(code: Int) {
            switch code {
            case -101:
                self = .invalidResponse
            case 400:
                self = .badRequest
            case 401:
                self = .tokenExpired
            case 409:
                self = .conflict
            case 500...599:
                self = .serviceUnavailable
            case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost :
                self = .notInternetConnection
            case NSURLErrorCancelled:
                self = .requestCancelled
            case NSURLErrorTimedOut, NSURLErrorCannotConnectToHost:
                self = .timeout
            default:
                self = .general
            }
        }
        
        public var code: Int {
            switch self {
            case .invalidResponse:
                return -101
            case .general:
                return -100
            case .badRequest:
                return 400
            case .tokenExpired:
                return 401
            case .conflict:
                return 409
            case .serviceUnavailable:
                return 500
            case .notInternetConnection:
                return NSURLErrorNotConnectedToInternet
            case .requestCancelled:
                return NSURLErrorCancelled
            case .timeout:
                return NSURLErrorTimedOut
            }
        }
        
        public var description: String {
            var localizedKey = ""
            switch self {
            case .badRequest:
                localizedKey = "Bad Request"
            case .general:
                localizedKey = "General"
            case .invalidResponse:
                localizedKey = "Invalid Service Response"
            case .notInternetConnection:
                localizedKey = "Por favor, revisa tu conexión a internet e intenta nuevamente."
            case .requestCancelled:
                localizedKey = "Request Cancelled"
            case .serviceUnavailable:
                localizedKey = "Service Unavailable"
            case .timeout:
                localizedKey = "Existe problemas con la conexión de internet. Por favor vuelva a intentar."
            case .conflict:
                localizedKey = "No se puede Agregar otro Pedido"
            case .tokenExpired:
                localizedKey = "Su sesión ha expirado."
            }
            return Bundle.main.localizedString(forKey: localizedKey, value: localizedKey, table: "LocalizableError")
        }
    }
    
    
    // MARK: - Properties
    private(set) var type:Kind
    private(set) var code:Int
    public var message:String = ""
    public  var typeError : Kind{
        return type
    }
    public var asNSError:NSError {
        return self as NSError
    }
    
    // MARK: - Constructors
    public init(kind:Kind) {
        self.type = kind
        self.code = kind.code
        self.message = kind.description
    }
    
    public init(code:Int) {
        self.code = code
        self.type = Kind(code: code)
        self.message = type.description
    }
    
    public init(code:Int, message:String) {
        self.code = code
        self.message = message
        self.type = Kind(code: code)
    }
    
    public init(code:Int, data:Data?) {
        guard let errorData = data else {
            self.init(code: code)
            return
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: errorData, options:.allowFragments) as? [String:Any],
                let message = json["error_description"] as? String {
                self.init(code: code, message: message)
            } else {
                self.init(code: code)
            }
        } catch {
             self.init(code: code)
        }
    }
}

// MARK: - CustomNSError
extension ServiceError: CustomNSError {
    
    public var errorCode: Int {
        return code
    }
    
    public var errorUserInfo: [String : Any] {
        return [NSLocalizedDescriptionKey: message]
    }
    
}

// MARK: - CustomStringConvertible
extension ServiceError: CustomStringConvertible {
    
    public var description:String {
        return message
    }
    
}
