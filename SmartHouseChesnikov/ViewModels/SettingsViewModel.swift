//
//  SettingsViewModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation
import Combine

protocol SettingsViewModel {
    func getSettings()
    func getProfile()
}

class SettingsViewModelImpl: NSObject, ObservableObject, SettingsViewModel {
    
    private let serviceSettings: SettingsService = SettingsServiceImpl()
    private let serviceProfile: ProfileService = ProfileServiceImpl()
    
    private(set) var settings: [Setting] = []
    @Published private(set) var profile: ProfileResponse = .dummyData
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: SettingsState = .loading
    @Published private(set) var profileState: ProfileState = .loading
    
    func getSettings() {
        
        state = .loading
        
        serviceSettings
            .request(from: .getSettings)
            .sink { [weak self] res in
                guard let strongSelf = self else { return }
                switch res {
                case .finished:
                    strongSelf.state = .success(content: strongSelf.settings)
                case .failure(let error):
                    strongSelf.state = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.settings = response
            }
            .store(in: &cancellables)
    }
    
    func getProfile() {
        
        state = .loading
        
        serviceProfile
            .request(from: .getProfile)
            .sink { [weak self] res in
                guard let strongSelf = self else { return }
                switch res {
                case .finished:
                    strongSelf.profileState = .success(content: strongSelf.profile)
                case .failure(let error):
                    strongSelf.profileState = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.profile = response
            }
            .store(in: &cancellables)
    }
}
