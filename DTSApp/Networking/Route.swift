//
//  Route.swift
//  Api Task
//
//  Created by Apple  on 12/01/2023.
//

import Foundation
 
enum Route {
    static let baseUrl = "http://175.107.63.137/api/Apis/"
    case home
    case login
    case fetchAttractions
    case basicInfo
    case contactInfo
    case legalInfo
    case financialInfo
    case pendingApplications
    case remarks
    case bussinessScope
    case uploadFile
    case inspectedList
    case recommendedList
    case notRecommendedList
    case GetInspectorCompleteChart
    case notification
    case makeReport
    case physicalInfo
    case notificationCount
    var description: String {
        switch self {
        case .home: return "GetTotal"
        case .login: return "FnLogin"
        case .fetchAttractions: return "api/mobile/attractions/getdistrictwise"
        case .basicInfo: return "GetBasicInspectionDetails"
        case .contactInfo: return "GetContactInspectionDetails"
        case .legalInfo: return "GetLegalInspectionDetails"
        case .financialInfo: return "GetFinancailInspectionDetails"
        case .pendingApplications: return "GetAssignApplication"
        case .remarks: return "GetInspectionRemarks"
        case .bussinessScope: return "GetScopeDetails"
        case .uploadFile: return "GetFilesDetails"
        case .inspectedList: return "GetInspectedInspection"
        case .recommendedList: return "GetRecomendedInspection"
        case .notRecommendedList: return "GetNotRecomendedInspection"
        case .GetInspectorCompleteChart: return "GetInspectorCompleteChart"
        case .notification: return "GetInspectorNotificationList"
        case .makeReport: return "FnInspectionReport"
        case .physicalInfo: return "GetPhysicalBasicDetails"
        case .notificationCount: return "GetInspectorNotification"
        }
    }
}
