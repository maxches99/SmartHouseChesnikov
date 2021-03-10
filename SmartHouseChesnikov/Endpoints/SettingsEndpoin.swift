//
//  SettingsAPI.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

enum SettingsAPI {
    case getSettings
}

extension SettingsAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: URL( string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding! + appendingString)!)
    }
    
    var path: String {
        switch self {
        case .getSettings:
            return "/_get_settings"
        }
    }
    
    var appendingString: String {
        switch self {
        default:
            return ""
        }
    }
}
