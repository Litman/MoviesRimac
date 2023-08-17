//
//  LoginProtocol.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController 
    
    func goToHomeViewController(from viewProtocol: LoginViewProtocol)
}

protocol LoginPresenterProtocol: AnyObject {
    
    var view: LoginViewProtocol? {get set}
    var user: String {get set}
    var password: String {get set}    
    
    func login()
    
}

protocol LoginViewProtocol: AnyObject {
    
    func isLoginEnabled(active: Bool)
    func showErrorLogin(message: String)
    
}

protocol LoginInteractorProtocol: AnyObject {
    
    func login(user: String, password: String) //Validate business login
    
}

protocol LoginInteractorToPresenterProtocol: AnyObject {
    
    func didReceiveError(message: String?)
    
    func didReceiveSuccessLogin()
    
}
