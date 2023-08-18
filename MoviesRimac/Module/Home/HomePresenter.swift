//
//  HomePresenter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
        
    var listMovies: [MovieModel]?
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    public var currentPage = 1
    public var totalPage = 0
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
        listMovies = []
        
    }
    
    func startGetMovies() {
        currentPage = 1
        totalPage = 0
        let paging = "\(currentPage)"
        interactor.getListMovies(apiKey: Constants.apiKey, page: paging)
    }
    
    func loadMoreData() {
        print("cargar mas \(currentPage) -- \(totalPage)")
        if currentPage < totalPage {
            currentPage += 1
            let paging = "\(currentPage)"
            interactor.getMoreMovies(apiKey: Constants.apiKey, page: paging)
        }
        
    }
    
    func moveToDetailView(data: MovieModel) {
        router.goToDetailViewController(from: view!, data: data)
    }
    
    func loadDataFromDB() {
        interactor.getMoviesFromDB()
    }
    
}


extension HomePresenter: HomeInteractorToPresenterProtocol {
       
    func diReceiveError() {
        
    }
    
    func didReceiveSuccessMovies(listMovies: MoviesModel) {
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoviesTable(withMovies: listMovies.result)
        saveMoviesDB(listMovies: listMovies)
    }
    
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel) {
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoreMovies(withMovies: listMovies.result)
    }
    
    func saveMoviesDB(listMovies: MoviesModel) {
        
        guard let movies = listMovies.result else {return}
        
        movies.forEach { item in
            var imageRec: UIImage?
            DispatchQueue.main.async {
                
//                let url = getUrl(item.posterPath ?? "")
//                let data = try? Data(contentsOf: url)
//                imageRec = UIImage(data: data!)
                let dataTask = URLSession.shared.dataTask(with: getUrl(item.posterPath ?? "")) {
                    [weak self] (data, _, _) in
                    if let data = data {
                        imageRec = UIImage(data: data)
                        self?.interactor.saveMovie(data: item, image: imageRec)
                    }
                }
                dataTask.resume()
                
            }
            
            
        }
        
    }
    
    func didReceiveSuccessMoviesDB(listMovies: [MovieModel]) {
        view?.reloadMoviesTable(withMovies: listMovies)
    }
    
}
