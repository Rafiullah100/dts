//
//  BasicInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import Foundation

struct BasicInfoViewModel: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let Detail: String
}

extension BasicInfoViewModel {
    static let DatailsData = [
        BasicInfoViewModel(icon: "person", title: "Submitted BY:", Detail: "Nasir Khan"),
        BasicInfoViewModel(icon: "calendar", title: "Submitted Date:", Detail: "23 March 2023, 02: 02 PM"),
        BasicInfoViewModel(icon: "district", title: "District:", Detail: "Charsadda"),
        BasicInfoViewModel(icon: "location-mark", title: "Postal Address", Detail: "Sher Market, near Govtt High School No. 2, Charsadda"),
        BasicInfoViewModel(icon: "phone", title: "Contact Number", Detail: "111111111"),
        BasicInfoViewModel(icon: "web-icon", title: "Business", Detail: "www.nic.com"),
        BasicInfoViewModel(icon: "email", title: "Business Email", Detail: "123@gmail.com")
    ]
}
