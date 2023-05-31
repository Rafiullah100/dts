//
//  ContactInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//


import Foundation

struct ContactInfoViewModel: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let Detail: String
}

extension ContactInfoViewModel {
    static let DatailsData = [
        BasicInfoViewModel(icon: "person", title: "Contact Person:", Detail: "Nasir Khan"),
        BasicInfoViewModel(icon: "designation-icon", title: "Designation:", Detail: "-"),
        BasicInfoViewModel(icon: "phone", title: "Mobile Number", Detail: "111111111"),
        BasicInfoViewModel(icon: "whatsapp-icon", title: "WhatsApp ID", Detail: "-"),
        BasicInfoViewModel(icon: "skype-icon", title: "Skype ID", Detail: "-")
    ]
}
