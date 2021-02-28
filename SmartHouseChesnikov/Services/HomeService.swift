//
//  HomeService.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation
import Combine

protocol HomeService {
    func request(from endpoint: HomeAPI) -> AnyPublisher<HomeResponse, APIError>
}

struct HomeServiceImpl: HomeService {
    
    func request(from endpoint: HomeAPI) -> AnyPublisher<HomeResponse, APIError> {
        print(endpoint.urlRequest)
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<HomeResponse, APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data).decode(type: HomeResponse.self, decoder: JSONDecoder())
                        .mapError { _ in APIError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
