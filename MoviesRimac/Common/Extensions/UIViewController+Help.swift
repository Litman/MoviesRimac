//
//  UIViewController+Help.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 16/08/23.
//

import UIKit
import Foundation


extension UIViewController {
    
    public func insertChild(viewController: UIViewController, inView: UIView) {
        addChild(viewController)
        viewController.willMove(toParent: self)
        inView.fillWithSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    
    func showAlert(_ title: String?, _ message: String?) {
        var titleDefault = title ?? Constants.title_alert_default
        var messageDefault = message ?? Constants.message_alert_default
        let alert = UIAlertController(title: titleDefault, message: messageDefault, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
