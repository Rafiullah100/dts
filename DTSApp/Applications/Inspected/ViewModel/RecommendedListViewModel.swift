//
//  BasicInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import Foundation

struct RecommendedListViewModel: Identifiable {
    let id = UUID()
    let title: String
    let Detail: String
}

extension RecommendedListViewModel {
    static let DatailsData = [
        RecommendedListViewModel(title: "Business Name", Detail: "Osama Travel and Tours"),
        RecommendedListViewModel(title: "Business Type", Detail: "Travel Agency"),
        RecommendedListViewModel(title: "Remarks", Detail: "Good")
    ]
}
