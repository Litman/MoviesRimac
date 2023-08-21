//
//  HomePresenterMock.swift
//  MoviesRimacTests
//
//  Created by Litman Ayala Laura on 20/08/23.
//

import Foundation
@testable import MoviesRimac

class HomePresenterMock: HomePresenterProtocol, HomeInteractorToPresenterProtocol {
    
    
    func diReceiveError() {
        
    }
    
    func didReceiveSuccessMovies(listMovies: MoviesRimac.MoviesModel) {
        self.listMovies = listMovies.result
    }
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesRimac.MoviesModel) {
        
    }
    
    func didReceiveSuccessMoviesDB(listMovies: [MoviesRimac.MovieModel]) {
        
    }
    
    var listMovies: [MoviesRimac.MovieModel]?
    
    
    var view: MoviesRimac.HomeViewProtocol?
    
    func startGetMovies() {
        
    }
    
    func loadMoreData() {
        
    }
    
    func moveToDetailView(data: MoviesRimac.MovieModel) {
        
    }
    
    func loadDataFromDB() {
        
    }
    
    func logout() {
        
    }

    
}
