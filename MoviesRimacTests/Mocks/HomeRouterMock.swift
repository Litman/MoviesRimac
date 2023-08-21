//
//  HomeRouterMock.swift
//  MoviesRimacTests
//
//  Created by Litman Ayala Laura on 20/08/23.
//

import Foundation
import UIKit

@testable import MoviesRimac

class HomeRouterMock: HomeRouterProtocol {
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func goToDetailViewController(from viewProtocol: MoviesRimac.HomeViewProtocol, data: MoviesRimac.MovieModel) {
        
    }
    
    func goToLoginViewController(from viewProtocol: MoviesRimac.HomeViewProtocol) {
        
    }
    
    
}
