//
//  LoginPresenter.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation


class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol
    
    var user: String {
        didSet {
            checkFormatValidate()
        }
    }
    
    var password: String {
        didSet {
            checkFormatValidate()
        }
    }
    
    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
        user = "Admin"
        password = "Password*123"
        
    }
    
    func login() {
        
        interactor.login(user: user, password: password)
    }
    
    func checkFormatValidate() {
        
        let isValid = user.isEmpty == false && password.isEmpty == false
        view?.isLoginEnabled(active: isValid)
    }
    
    
    
    
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    
    func didReceiveError(message: String?) {
        view?.showErrorLogin(message: message!)
    }
    
    func didReceiveSuccessLogin() {
        router.goToHomeViewController(from: self.view!)
    }
    
    
}
