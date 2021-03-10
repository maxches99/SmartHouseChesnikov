//
//  SettingsService.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation
import Combine

protocol SettingsService {
    func request(from endpoint: SettingsAPI) -> AnyPublisher<[Setting], APIError>
}

struct SettingsServiceImpl: SettingsService {
    
    func request(from endpoint: SettingsAPI) -> AnyPublisher<[Setting], APIError> {
        print(endpoint.urlRequest)
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<[Setting], APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let settingsResponse: SettingsResponse = try! JSONDecoder().decode(SettingsResponse.self, from: data)
                    var settings: [Setting] = []
                    settingsResponse.names?.forEach { settings.append(.init(name: $0)) }
                    return Just(settings)
                        .mapError { _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

