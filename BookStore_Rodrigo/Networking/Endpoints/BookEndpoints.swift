//
//  BookEndpoints.swift
//  BookStore_Rodrigo
//
//  Created by Rodrigo Giglio on 08/01/21.
//

import Foundation
import Moya

/// The endopint enum is prepared to
/// implement more API calls in the future

enum BookEndpoints: TargetType {
    
    // MARK: - Constants
    private static let DEFAULT_QUERY = "iOS"
    private static let DEFAULT_MAX_RESULTS = 20

    // MARK: - Endpoints
    case getVolumes(page: Int)
    
    var path: String {
        
        switch self {
            case .getVolumes: return "/volumes"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            case .getVolumes: return .get
        }
    }
    
    var task: Task {
        
        switch self {
            case .getVolumes(let page):
                let parameters = [
                    "q": BookEndpoints.DEFAULT_QUERY,
                    "maxResults": "\(BookEndpoints.DEFAULT_MAX_RESULTS)",
                    "startIndex": "\((page * BookEndpoints.DEFAULT_MAX_RESULTS) + 1)"
                ]
                
                return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
}
