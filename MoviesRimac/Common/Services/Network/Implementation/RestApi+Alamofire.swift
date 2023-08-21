//
//  RestApi+Alamofire.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

// MARK: - RestApi Public
extension RestApi {
    
    public var authenticatedHeaders: [String : String] {
        ["Authorization": "Bearer \(SecurityRepository.shared.token)"]
    }
    
    public func request<T: Decodable>(of type: T.Type = T.self,
                                      url: String,
                                      verb: HTTPVerb,
                                      parameters: [String: Any]? = nil,
                                      headers: [String: String]? = nil,
                                      completion: @escaping (ResponseApi<T>) -> Void) {
        let request = createRequest(at: url, verb: verb, parameters: parameters, headers: headers, needsAuthentication: false)
        request.responseDecodable(of: T.self) { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
                
            case .failure(let afError):
                let responseError = self.crearteError(from: afError, with: response.data)
                completion(.failure(responseError))
            }
        }
    }
    
    
    public func requestJSON(url: String,
                     verb: HTTPVerb,
                     parameters: [String: Any]? = nil,
                     headers: [String: String]? = nil,
                     needsAuthentication: Bool = false,
                     completion: @escaping (ResponseApi<Any>) -> Void) {
        let request = createRequest(at: url, verb: .get, headers: headers, needsAuthentication: needsAuthentication)
        
        request.responseJSON { response in
            switch response.result {
            case .success(let json):
                completion(.success(json))
                
            case .failure(let afError):
                print("Error \(afError)")
                let responseError = self.crearteError(from: afError, with: response.data)
                completion(.failure(responseError))
            }
        }
        
    }
    
    public func download(imageAt url: String,
                         headers: [String:String]? = nil,
                         needsAuthentication: Bool = false,
                         completion: @escaping (ResponseApi<UIImage>) -> Void) {
        let request = createRequest(at: url, verb: .get, headers: headers, needsAuthentication: needsAuthentication)
        request.responseImage { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
                
            case .failure(let afError):
                let responseError = self.crearteError(from: afError, with: response.data)
                completion(.failure(responseError))
            }
        }
    }
    
//    public func upload<T: Decodable>(image: RestApiImage,
//                                     to url: String,
//                                     headers: [String:String]? = nil,
//                                     params : [String:String]? = nil,
//                                     needsAuthentication: Bool = false,
//                                     responseType type: T.Type = T.self,
//                                     completion: @escaping (ResponseApi<T>) -> Void) {
//        
//        var serviceHeaders: HTTPHeaders?
//        if let allHeaders = headers {
//            serviceHeaders = HTTPHeaders(allHeaders)
//        }
//        let interceptor:RequestInterceptor? = needsAuthentication ? RestApiInterceptor(api: self) : nil
//        let request = HTTPSession.shared.session.upload(multipartFormData: { multipart in
//            let serializedImage = image.serialized()
//            multipart.append(serializedImage.data, withName: image.name, fileName: image.fileName, mimeType: serializedImage.mimeType)
//            if let params = params {
//                for(key, value) in params{
//                    if let value = value.data(using: String.Encoding.utf8){
//                        multipart.append(value, withName: key)
//                    }
//                }
//            }
//        }, to: url, method: .post, headers: serviceHeaders, interceptor: interceptor)
//        
//        request.validate().responseDecodable(of: T.self) { (response) in
//            switch response.result {
//            case .success(let value):
//                completion(.success(value))
//                
//            case .failure(let afError):
//                let responseError = self.crearteError(from: afError, with: response.data)
//                completion(.failure(responseError))
//            }
//        }
//    }
    
}

// MARK: - RestApi Private
fileprivate extension RestApi {
    
    func createRequest(at url: String,
                       verb: HTTPVerb,
                       parameters: [String: Any]? = nil,
                       headers: [String: String]? = nil,
                       encodingParam : ParameterEncoding? = nil,
                       needsAuthentication:Bool) -> DataRequest {
        var serviceHeaders: HTTPHeaders?
        if let allHeaders = headers {
            serviceHeaders = HTTPHeaders(allHeaders)
        }
        var encoding:ParameterEncoding = verb == .get ? URLEncoding.default : JSONEncoding.default
        if let encodingParam = encodingParam {
            encoding = encodingParam
        }
        let interceptor:RequestInterceptor? = needsAuthentication ? RestApiInterceptor(api: self) : nil
        let request = HTTPSession.shared.request(url,
                                                 method: verb.value,
                                                 parameters: parameters,
                                                 encoding: encoding,
                                                 headers: serviceHeaders,
                                                 interceptor: interceptor)
        return request.validate()
    }
    
    func crearteError(from afError:AFError, with data:Data?) -> ServiceError {
        if let code = afError.responseCode {
            return ServiceError(code: code, data: data)
        }
        
        
        if case .requestRetryFailed(_ ,let originalError) = afError,let urlError = ((originalError.asAFError?.underlyingError as? AFError)?.underlyingError as? URLError){
            return ServiceError(code: urlError.errorCode)
        }
        
        if let urlError = afError.underlyingError as? URLError {
            return ServiceError(code: urlError.errorCode)
        }else{
            let nsError = afError as NSError
            return ServiceError(code: nsError.code)
        }
        
        
    }
    
}

// MARK: - HTTPVerb Private
fileprivate extension HTTPVerb {
    
    var value: HTTPMethod {
        switch self {
        case .connect:
            return .connect
        case .delete:
            return .delete
        case .get:
            return .get
        case .head:
            return .head
        case .options:
            return .options
        case .patch:
            return .patch
        case .post:
            return .post
        case .put:
            return .put
        case .trace:
            return .trace
        }
    }
    
}


