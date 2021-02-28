//
//  HomeViewModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation
import Combine

protocol HomeViewModel {
    func getHome()
}

class HomeViewModelImpl: NSObject, ObservableObject, HomeViewModel {
    
    private let service: HomeService
    
    private(set) var sensors: [Sensor] = []
    private(set) var home: HomeResponse = HomeResponse.dummyData
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: HomeService) {
        self.service = service
    }
    
    func getHome() {
        
        state = .loading
        
        service
            .request(from: .getData)
            .sink { [weak self] res in
                guard let strongSelf = self else { return }
                switch res {
                case .finished:
                    strongSelf.state = .success(content: strongSelf.sensors)
                case .failure(let error):
                    strongSelf.state = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.home = response
                for i in 0..<(response.sensors?.count ?? 0) {
                    switch response.sensorsType?[i] {
                    case "Smoke":
                        self?.sensors.append(Sensor(name: response.sensors?[i], value: response.values?[i], type: .smoke))
                    case "Temp":
                        self?.sensors.append(Sensor(name: response.sensors?[i], value: response.values?[i], type: .temp))
                    default:
                        self?.sensors.append(Sensor(name: response.sensors?[i], value: response.values?[i], type: .temp))
                    }
                }
            }
            .store(in: &cancellables)
    }
}
