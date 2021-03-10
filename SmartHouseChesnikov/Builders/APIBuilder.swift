//
//  APIBuilder.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

extension APIBuilder {
    var baseUrl: URL {
        return URL(string: "https://maxches99.pythonanywhere.com")!
    }
}
