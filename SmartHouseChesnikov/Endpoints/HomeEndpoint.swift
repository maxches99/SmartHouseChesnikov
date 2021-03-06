//
//  HomeEndpoint.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

enum HomeAPI {
    case getData
    case getProfile
}

extension HomeAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: URL( string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding! + appendingString)!)
    }
    
    var path: String {
        switch self {
        case .getData:
            return "/_get_json"
        case .getProfile:
            return "/_get_profile"
        }
    }
    
    var appendingString: String {
        switch self {
        default:
            return ""
        }
    }
}

