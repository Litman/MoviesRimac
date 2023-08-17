//
//  LoginRouter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit


class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        let viewController = LoginViewController(presenter: presenter)
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
    
    func goToHomeViewController(from viewProtocol: LoginViewProtocol) {
        
        let router = HomeRouter.createModule() as! HomeViewController
        
        guard let viewController = viewProtocol as? UIViewController else {
            return
        }
        viewController.navigationController?.pushViewController(router, animated: true)
        
    }
}
