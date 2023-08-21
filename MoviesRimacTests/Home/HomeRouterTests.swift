//
//  HomeRouterTests.swift
//  MoviesRimacTests
//
//  Created by Litman Ayala Laura on 20/08/23.
//

import Foundation
import XCTest
@testable import MoviesRimac

final class HomeRouterTests: XCTestCase {
    
    var sut: HomeRouterProtocol!
    var view: HomeViewProtocol!
    var presenter: HomePresenterProtocol!
    var interactor: HomeInteractorProtocol!
    var repository: HomeApiRepositoryProtocol!
    var respositoryDB: MoviesCoreDataRepositoryProtocol!
    var routerDetail: MovieDetailRouterProtocol!
    
    
    override func setUpWithError() throws {
        repository = HomeApiRepository()
        respositoryDB = MoviesCoreDataRepository()
        interactor = HomeInteractor(repository: repository as! HomeApiRepository, repositoryDB: respositoryDB as! MoviesCoreDataRepository)
        sut = HomeRouter()
        presenter = HomePresenter(interactor: interactor, router: sut)
        
        view = HomeViewController(presenter: presenter)
        presenter.view = view
        routerDetail = MovieDetailRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        repository = nil
        respositoryDB = nil
        interactor = nil
        presenter = nil
        routerDetail = nil
    }
     
    func test_createModule() {
        
        let viewController = HomeRouter.createModule()
        let homeViewController = viewController as? HomeViewController
        XCTAssertNotNil(homeViewController)
        
    }
    
    
  
    
}
