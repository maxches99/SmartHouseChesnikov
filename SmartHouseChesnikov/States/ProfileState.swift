//
//  ProfileState.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

enum ProfileState {
    case loading
    case success(content: ProfileResponse)
    case failed(error: Error)
    
    var title: String {
        switch self {
        case .loading:
            return "Идет поиск вашего профиля"
        case .success(_):
            return "Дом загружен, а ты все еще с нами"
        case .failed(_):
            return "Сервак работает, но что-то пошло не так"
        }
    }
}
