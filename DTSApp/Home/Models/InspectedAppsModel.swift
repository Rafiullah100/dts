//
//  InspectedAppsModel.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation

struct InspectedAppsModel: Codable, Hashable {
    let district: String
    let number, percentage: Int

    enum CodingKeys: String, CodingKey {
        case district = "District"
        case number = "Number"
        case percentage = "Percentage"
    }
}
