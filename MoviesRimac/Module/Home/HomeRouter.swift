//
//  HomeRouter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let repository: HomeApiRepository = HomeApiRepository()
        let repositoryDB: MoviesCoreDataRepository = MoviesCoreDataRepository()
        let router = HomeRouter()
        let interactor = HomeInteractor(repository: repository, repositoryDB: repositoryDB)
        let presenter = HomePresenter(interactor: interactor, router: router)
        let viewController = HomeViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
    
    func goToDetailViewController(from viewProtocol: HomeViewProtocol, data: MovieModel) {
        
        let router = MovieDetailRouter.createModule(data: data) as! MovieDetailViewController
        
        guard let viewController = viewProtocol as? UIViewController else {
            return
        }
        
        viewController.navigationController?.pushViewController(router, animated: true)
        
    }
    
}
