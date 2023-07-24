//
//  PhysicalResourcesViewModel.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import Foundation

struct PhysicalResourcesViewModel: Identifiable {
    let id = UUID()
    let title: String
    let Detail: String
}


struct PhysicalAccordionViewModel: Identifiable {
    var id = UUID()
    let title: String
    let detail: String
}

extension PhysicalAccordionViewModel {
    static let accordionData = [
        PhysicalAccordionViewModel(title: "Vehical Registration No. :", detail: "-"),
        PhysicalAccordionViewModel(title: "Model: ", detail: "2023"),
        PhysicalAccordionViewModel(title: "Vehical Type", detail: "Toyota Supra"),
        PhysicalAccordionViewModel(title: "Owner", detail: "Osama Khan")
    ]
}
