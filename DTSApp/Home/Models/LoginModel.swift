//
//  LoginModel.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation

// MARK: - Welcome
struct LoginModel: Codable {
    let departmentID: Int?
    let name, designation, message: String?

    enum CodingKeys: String, CodingKey {
        case departmentID = "DepartmentId"
        case name = "Name"
        case designation = "Designation"
        case message
    }
}
