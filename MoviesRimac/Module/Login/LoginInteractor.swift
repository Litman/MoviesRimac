//
//  LoginInteractor.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginInteractorToPresenterProtocol?
    
    func login(user: String, password: String) {
        //TODO logica para validacin
        guard user == "Admin", password == "Password*123" else {
            presenter?.didReceiveError(message: Constants.wrong_user_or_password)
            return
        }
        
        presenter?.didReceiveSuccessLogin()
    }
    
}
