//
//  MovieDetailPresenter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    var movieModel: MovieModel?
    
    weak var view: MovieDetailViewProtocol?
    var router: MovieDetailRouterProtocol
    
    
    
    init(data: MovieModel, router: MovieDetailRouterProtocol) {
        self.router = router
        self.movieModel = data
        
    }
    
    func showDetailMovie() {
        view?.showMovieDetail(data: movieModel)
    }
    
    
}
