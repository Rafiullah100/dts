//
//  PendingViewModel.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import Foundation
struct PendingApplicationsViewModel: Identifiable {
    let id = UUID()
    let title: String
}
extension PendingApplicationsViewModel {
    static let DetailsData = [
        PendingApplicationsViewModel(title: "Adnan Travel and Tours"),
        PendingApplicationsViewModel(title: "Travel Agency"),
        PendingApplicationsViewModel(title: "April 12, 2023"),
        PendingApplicationsViewModel(title: "New"),
        PendingApplicationsViewModel(title: "For inspection")
        
    ]
}
