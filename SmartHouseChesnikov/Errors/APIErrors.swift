//
//  APIErrors.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Мы не смогли понять что вернул сервак"
        case .errorCode(let code):
            return "Код ошибки - \(code), вы не виноваты"
        case .unknown:
            return "Мы не знаем, что произошло"
        }
    }
}
