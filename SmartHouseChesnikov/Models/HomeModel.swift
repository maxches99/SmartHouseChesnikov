//
//  HomeModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

// MARK: - Forecast
struct HomeResponse: Codable, Identifiable, Hashable {
    let id = UUID()
    let nameOfHouse: String?
    let sensorsType: [String]?
    let sensors: [String]?
    let values: [String]?
}

extension HomeResponse {
    static var dummyData: HomeResponse {
        .init(nameOfHouse: "CoollerHouse", sensorsType: ["Smoke"], sensors: ["Smoke in kitchen"], values: ["xmark.icloud"])
    }
}

struct Sensor: Identifiable {
    let id = UUID()
    let name: String?
    let value: String?
    let type: SensorType
}

extension Sensor {
    static var dummyData: Sensor {
        .init(name: HomeResponse.dummyData.sensors?.first, value: HomeResponse.dummyData.values?.first, type: .smoke)
    }
}

enum SensorType{
    case temp
    case smoke
}
