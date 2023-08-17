//
//  RestApiInterceptor.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Alamofire
import Foundation

struct RestApiInterceptor: Alamofire.RequestInterceptor {
    
    weak var api: RestApi?
    
    init(api: RestApi) {
        self.api = api
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        let token = "Bearer \(SecurityRepository.shared.token)"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
            response.statusCode == ServiceError.Kind.tokenExpired.code else {
                /// The request did not fail due to a 401 Unauthorized response.
                /// Return the original error and don't retry the request.
            
            
                return completion(.doNotRetryWithError(error))
        }
        
//        api?.refreshToken(completion: { (response) in
//            switch(response) {
//            case .success(let responseToken):
//                print("Ok Refresh - \(responseToken)")
//                completion(.retry)
//            case .failure(let afError):
//                print("Ok Refresh Error - \(afError)")
//                api?.tokenExpiredChangeLogout()
//            }
//        })

//        api?.refreshToken(completion: { error in
//            if let anError = error {
//                api?.tokenExpiredChangeLogout()
//            } else {
//                completion(.retry)
//            }
//        })
    }
}
