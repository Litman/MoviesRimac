//
//  HomeInteractor.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit

class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorToPresenterProtocol?
    var repository: HomeApiRepositoryProtocol?
    var repositoryDB: MoviesCoreDataRepositoryProtocol?
    
    init(repository: HomeApiRepositoryProtocol, repositoryDB: MoviesCoreDataRepositoryProtocol) {
        self.repository = repository
        self.repositoryDB = repositoryDB
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
    
    func saveMovie(data: MovieModel?, image: UIImage?) {
        
        
        repositoryDB?.saveMovie(movie: data!, withImage: image!)
        
        
    }
    
    
    func getMoviesFromDB() {
        
        repositoryDB?.fetchMoviesCoreData(completion: { [weak self] listMovies in
            guard let self = self else { return }
            
            let listMoviesTemp = wrapLidtMoviesDBInDataModel(listCoreData: listMovies)
            
            presenter?.didReceiveSuccessMoviesDB(listMovies: listMoviesTemp)
            
        })
        
    }
    
    func wrapLidtMoviesDBInDataModel(listCoreData: [MoviesCoreData]) -> [MovieModel] {
        var listMovies = [MovieModel]()
        listCoreData.forEach {
            (item) in
            var movie = MovieModel()
            movie.id = Int(item.id)
            movie.overview = item.overview
            movie.posterPath = item.poster_path
            movie.releaseDate = item.release_date
            movie.title = item.title
            movie.voteAverage = item.vote_average
            
            listMovies.append(movie)
        }
        return listMovies
    }
    
    
}
