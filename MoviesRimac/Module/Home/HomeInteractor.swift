//
//  HomeInteractor.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
       
    
    weak var presenter: HomeInteractorToPresenterProtocol?
    var repository: HomeApiRepository?
    
    init(repository: HomeApiRepository) {
        self.repository = repository
    }
    
    func getListMovies(apiKey: String, page: String) {
        repository?.getListMovies(apiKey: apiKey, page: page, completion: { [weak self] (response) in
            switch response {
            case .success(let responseData):
                self?.presenter?.didReceiveSuccessMovies(listMovies: responseData)
            case .failure(let networkError):
                self?.presenter?.diReceiveError()
            }
        })
    }
    
    func getMoreMovies(apiKey: String, page: String) {
        repository?.getListMovies(apiKey: apiKey, page: page, completion: { [weak self] (response) in
            switch response {
            case .success(let responseData):
                self?.presenter?.didReceiveSuccessMoreMovies(listMovies: responseData)
            case .failure(let networkError):
                self?.presenter?.diReceiveError()
            }
        })
    }
    
}
