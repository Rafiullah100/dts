//
//  File.swift
//  DTSApp
//
//  Created by Macbook on 22/05/2023.
//

import Foundation
import SwiftUI


enum detailFormtab : Int, CaseIterable {
    case remarks
    case basicInfo
    case contactInfo
    case legalInfo
//    case financialInfo
//    case physicalResources
//    case businessScope
//    case uploadFiles
    
    var title: String {
        switch self {
        
        case .remarks:
            return "Remarks"
        case .basicInfo:
            return "Basic Info"
        case .contactInfo:
            return "Contact Info"
        case .legalInfo:
            return "Legal Info"
//        case .financialInfo:
//            return "Financial Info"
//        case .physicalResources:
//            return "Physical Resources"
//        case .businessScope:
//            return "Business Scope"
//        case .uploadFiles:
//            return "Upload Files"
        }
    }
}
