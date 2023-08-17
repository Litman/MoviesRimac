//
//  MovieDetailRouter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    
    static func createModule(data: MovieModel) -> UIViewController {
        
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(data: data, router: router)
        
        let viewController = MovieDetailViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
