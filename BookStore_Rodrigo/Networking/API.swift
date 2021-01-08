//
//  API.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation

enum API {
    
    static var currentScheme: API = .development
    
     /// For staging and production builds, the API URL
     /// must me defined here
    case development
    
    var url: String {
        
        switch self {
            case .development: return "https://www.googleapis.com/books/v1"
        }
    }
}
