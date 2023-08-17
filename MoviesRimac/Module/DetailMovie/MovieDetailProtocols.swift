//
//  MovieDetailProtocols.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import Foundation
import UIKit

protocol MovieDetailRouterProtocol: AnyObject {
    
    static func createModule(data: MovieModel) -> UIViewController
    
    
    
}

protocol MovieDetailPresenterProtocol: AnyObject {
    
    var view: MovieDetailViewProtocol? {get set}
    var movieModel: MovieModel? {get set}
    
    func showDetailMovie()
    
}

protocol MovieDetailViewProtocol: AnyObject {
    
    func showMovieDetail(data: MovieModel?)
    
}
