//
//  AppError.swift
//  Api Task
//
//  Created by Apple  on 11/01/2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea what go on"
        case .invalidUrl:
            return "give me a valid url"
        case .serverError(let error):
            return error
        }
    }
}
