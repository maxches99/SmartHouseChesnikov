//
//  HomeModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 18.02.2021.
//

import Foundation

// MARK: - HomeResponse
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
