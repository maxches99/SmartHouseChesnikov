//
//  SettingsModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

// MARK: - SettingsResponse
struct SettingsResponse: Codable {
    let names: [String]?
    let received: String?
}

extension SettingsResponse {
    static var dummyData: SettingsResponse {
        .init(names: ["Добавить новый датчик", "Изменить тему", "Передать показания счетчиков"], received: "Ok")
    }
}

struct Setting: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String?
}
