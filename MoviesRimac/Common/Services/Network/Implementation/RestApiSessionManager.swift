//
//  RestApiSessionManager.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//
import Foundation
import Alamofire
import AlamofireNetworkActivityLogger

class HTTPSession {

    
    
    static let shared: Session = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 90
        configuration.timeoutIntervalForResource = 90
        
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
        
        let allDomains = Constants.Network.disabledDomains
        var policies: [String: ServerTrustEvaluating] = [:]
        for domain in allDomains {
            policies[domain] = PinnedCertificatesTrustEvaluator(certificates: Bundle.main.af.certificates, acceptSelfSignedCertificates: true, performDefaultValidation: true, validateHost: false)
        }
            
        let trustManager = ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: policies)
        return Session(configuration: configuration, serverTrustManager: trustManager)
    }()
    
}
