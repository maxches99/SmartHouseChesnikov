//
//  HomeEndpoint.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum HomeAPI {
    case getData
}

extension HomeAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: URL( string: baseUrl.appendingPathComponent(path).absoluteString.removingPercentEncoding! + appendingString)!)
    }
    
    var baseUrl: URL {
        return URL(string: "https://maxches99.pythonanywhere.com")!
    }
    
    var path: String {
        return "/_get_json"
    }
    
    var appendingString: String {
        switch self {
        case .getData:
            return ""
        }
    }
}

