//
//  HomeApiRepository.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 14/08/23.
//

import Foundation

public protocol HomeApiRepositoryProtocol: RestApi {
    
    func getListMovies(apiKey: String, page: String, completion: @escaping (ResponseApi<MoviesModel>) -> Void)
    
}

public class HomeApiRepository: HomeApiRepositoryProtocol {
        
    
    
    public init() {
        
    }
    
    public func getListMovies(apiKey: String, page: String, completion: @escaping (ResponseApi<MoviesModel>) -> Void) {
        
        let url = "\(baseURL)\(ConstantsURL.movie)"
        let body = ["page":page, "api_key":apiKey]
        self.request(of: MoviesModel.self, url: url, verb: .get, parameters: body, headers: headers) {
            (response) in completion(response)
        }
        
    }
    
    
    
    
    
}
