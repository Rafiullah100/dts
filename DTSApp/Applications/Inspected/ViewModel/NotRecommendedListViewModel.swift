//
//  BasicInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import Foundation

struct NotRecommendedListViewModel: Identifiable {
    let id = UUID()
    let title: String
    let Detail: String
}

extension NotRecommendedListViewModel {
    static let DatailsData = [
        NotRecommendedListViewModel(title: "Business Name", Detail: "Osama Travel and Tours"),
        NotRecommendedListViewModel(title: "Business Type", Detail: "Travel Agency"),
        NotRecommendedListViewModel(title: "Remarks", Detail: "Good")
    ]
}
