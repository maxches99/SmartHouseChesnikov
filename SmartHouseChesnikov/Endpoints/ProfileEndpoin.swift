//
//  ProfileAPI.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

enum ProfileAPI {
    case getProfile
}

extension ProfileAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: URL( string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding! + appendingString)!)
    }
    
    var path: String {
        switch self {
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

