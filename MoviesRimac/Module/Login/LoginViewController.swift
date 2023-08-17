//
//  LoginViewController.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    
        
    private let userTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Enter user"
        textField.borderStyle = .none
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 0.5
        textField.addTarget(self, action: #selector(handleUserChange), for: .editingChanged)
        textField.text = "Admin"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.5
        textField.addTarget(self, action: #selector(handlePasswordChange), for: .editingChanged)
        textField.text = "Password*123"
        return textField
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            userTextField,
            passwordTextField,
            loginButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.backgroundColor = UIColor.clear
        return stackView
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.backgroundColor = .lightGray
        button.setTitleColor(.gray, for: .disabled)
//        button.isEnabled = false
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    
    
    private let presenter: LoginPresenterProtocol
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupView()
        
    }
    
    
    private func setupConstraints() {
        
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.topItem?.title = "Login"
        
    }
    
    
    @objc private func handleUserChange(textField: UITextField) {
        presenter.user = textField.text ?? ""
    }
    
    
    @objc private func handlePasswordChange(textField: UITextField) {
        presenter.password = textField.text ?? ""
    }
    
    
    @objc private func handleLogin(button: UIButton) {
        
        presenter.login()
        
    }
    
    
}

extension LoginViewController: LoginViewProtocol {
    
    func isLoginEnabled(active: Bool) {
        loginButton.isEnabled = active
        loginButton.backgroundColor = active ? .blue : .lightGray
        self.loginButton.setTitleColor(active ? .white : .gray, for: .normal)

    }
    
    func showErrorLogin(message: String) {
        showAlert(nil, message)
    }
    
}

