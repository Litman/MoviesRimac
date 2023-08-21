//
//  HomeProtocols.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
    func goToDetailViewController(data: MovieModel)
    
    func goToLoginViewController()
    
}

protocol HomePresenterProtocol: AnyObject {
    
    var view: HomeViewProtocol? {get set}
    var listMovies: [MovieModel]? {get set}
    
    
    func startGetMovies()
    func loadMoreData()
    func moveToDetailView(data: MovieModel)
    func loadDataFromDB()
    func logout()
    
}

protocol HomeViewProtocol: AnyObject {
    
    func reloadMoviesTable(withMovies data: [MovieModel]?)
    
    func reloadMoreMovies(withMovies data: [MovieModel]?)
    
    func showError(errorMessage: String)
    
    
}

protocol HomeInteractorProtocol: AnyObject {
    
    func getListMovies(apiKey: String, page: String)
    
    func getMoreMovies(apiKey: String, page: String)
    
    func saveMovie(data: MovieModel?, image: UIImage?)
    
    func getMoviesFromDB()
    
    
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    
    func diReceiveError(error: ServiceError)
    
    func didReceiveSuccessMovies(listMovies: MoviesModel)
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel)
    
    
    func didReceiveSuccessMoviesDB(listMovies: [MovieModel])
}
