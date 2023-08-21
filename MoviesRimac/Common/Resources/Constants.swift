//
//  Constants.swift
//  MoviesRimac
//
//  Created by Litman Ayala Laura on 11/08/23.
//

import Foundation


public enum Constants {
    
    public enum Security {
        static let token = "USER_TOKEN_KEY"
        static let refreshToken = "USER_REFRESH_TOKEN_KEY"
        static let clientId = "USER_CLIENT_ID"
        static let clientSecret = "USER_CLIENT_SECRET"
    }
    
    public enum Network {
        
        static let disabledDomains = ["pefrvlwasqaf003.pre.mx.corp"]
        
    }
    
    static let UrlKey = "ApplicationURL"
    
    static let apiKey = "5b6ea7dd466db535d3917335b0f83feb"
    
    static let title_release_date = "Fecha lanzamiento:"
    
    static let title_alert_default = "Aviso"
    static let message_alert_default = "Ocurrio algo inesperado."
    
    static let wrong_user_or_password = "Verifique su usuario o contraseña."
    
    static let title_description = "Descripción"
}

func getUrl(_ path: String) -> URL {
    let url = URL(string: "\(ConstantsURL.baseUrlImage)\(path)")
    return url ?? URL(string: "")!
    
}
