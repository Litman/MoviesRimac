//
//  HomePresenter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
        
    var listMovies: [MovieModel]?
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    var currentPage = 1
    var totalPage = 0
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
        listMovies = []
        
    }
    
    
    func startGetMovies() {
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
    
}


extension HomePresenter: HomeInteractorToPresenterProtocol {
       
    func diReceiveError() {
        
    }
    
    func didReceiveSuccessMovies(listMovies: MoviesModel) {
        print("Llego Listado \(listMovies.totalPages) -- \(listMovies.page)")
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoviesTable(withMovies: listMovies.result)
    }
    
    
    func didReceiveSuccessMoreMovies(listMovies: MoviesModel) {
        self.listMovies = listMovies.result
        totalPage = listMovies.totalPages ?? 0
        currentPage = listMovies.page ?? 0
        view?.reloadMoreMovies(withMovies: listMovies.result)
    }
    
}
