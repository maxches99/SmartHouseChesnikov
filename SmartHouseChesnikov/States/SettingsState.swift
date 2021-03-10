//
//  SettingsState.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

enum SettingsState {
    case loading
    case success(content: [Setting])
    case failed(error: Error)
    
    var title: String {
        switch self {
        case .loading:
            return "Идет поиск вашего дома"
        case .success(_):
            return "Дом загружен, а ты все еще с нами"
        case .failed(_):
            return "Сервак работает, но что-то пошло не так"
        }
    }
}
