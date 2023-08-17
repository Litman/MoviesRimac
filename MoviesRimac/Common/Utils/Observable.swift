//
//  Observable.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 15/08/23.
//

import Foundation

public struct ObservableCall<Input> {
    
    public init() {
        
    }
    
    private var callBack: ((Input)-> Void)?
    
    public mutating func bind<Observer: AnyObject>(to observer: Observer,
                                                   with callback: @escaping (Observer, Input)-> Void) {
        self.callBack = { [weak observer] input in
            guard let observer = observer else {
                return
            }
            callback(observer, input)
        }
    }
    
    public func notify(with input: Input) {
        callBack?(input)
    }

}

//MARK: - class Utils
public class Utils {
    
    public init() {
        
    }
    
    public func isValidEmail(_ email: String) -> Bool {
          
          // valida el mail del usuario
          let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
          
          let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
          return emailTest.evaluate(with: email)
    }
    
    class public func encodeUrl(withUrl url :String) -> String {
        let customAllowedSet =  NSCharacterSet(charactersIn:"=\"#%/<>?@\\^`{|}+").inverted
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: customAllowedSet) ?? ""
        return encodedUrl
    }
    
    
}
