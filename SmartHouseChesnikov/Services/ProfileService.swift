//
//  ProfileService.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation
import Combine

protocol ProfileService {
    func request(from endpoint: ProfileAPI) -> AnyPublisher<ProfileResponse, APIError>
}

struct ProfileServiceImpl: ProfileService {
    
    func request(from endpoint: ProfileAPI) -> AnyPublisher<ProfileResponse, APIError> {
        print(endpoint.urlRequest)
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<ProfileResponse, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data).decode(type: ProfileResponse.self, decoder: JSONDecoder())
                        .mapError { _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

