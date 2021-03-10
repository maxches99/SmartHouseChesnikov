//
//  SensorModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

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
