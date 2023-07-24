//
//  BasicInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import Foundation

struct InspectedListViewModel: Identifiable {
    let id = UUID()
    let title: String
    let Detail: String
}

extension InspectedListViewModel {
    static let DatailsData = [
        InspectedListViewModel(title: "Complete Date", Detail: "4 April 2023"),
        InspectedListViewModel(title: "Business Name", Detail: "Osama Travel and Tours"),
        InspectedListViewModel(title: "Business Type", Detail: "Travel Agency"),
        InspectedListViewModel(title: "Remarks", Detail: "Good")
    ]
}
