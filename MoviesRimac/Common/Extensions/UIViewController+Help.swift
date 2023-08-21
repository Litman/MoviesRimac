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
    
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 136, y: self.view.frame.size.height-40, width: 272, height: 35))
        toastLabel.backgroundColor = .gray
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 20;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 6.0, delay: 0.2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
