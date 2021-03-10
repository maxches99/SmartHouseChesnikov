//
//  ProfileModel.swift
//  SmartHouseChesnikov
//
//  Created by Max Chesnikov on 10.03.2021.
//

import Foundation

// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    let name: String?
    let address: String?
    let imgUrl: String?
    let received: String?
}

extension ProfileResponse {
    static var dummyData: ProfileResponse {
        .init(name: "Max Chesnikov", address: "Крепостной 43/98", imgUrl: "https://sun9-69.userapi.com/impf/c854420/v854420308/c2a0d/DKgnJC9Q9-8.jpg?size=2560x1696&quality=96&sign=9aa20b4fb7307f43c885395c7e433a7f&type=album", received: "Ok")
    }
}
