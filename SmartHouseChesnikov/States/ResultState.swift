//
//  ResultState.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation


enum ResultState {
    case loading
    case success(content: [Sensor])
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
