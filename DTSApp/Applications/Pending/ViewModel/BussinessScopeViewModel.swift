//
//  BussinessScopeViewModel.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import Foundation

struct BusinessScopeViewModel: Identifiable {
    let id = UUID()
    let title: String
}

extension  BusinessScopeViewModel {
    static let businessAccordionTitle = [
        BusinessScopeViewModel(title: "Main Office Business Scope"),
        BusinessScopeViewModel(title: "Main Guarrantee Business Scope"),
        BusinessScopeViewModel(title: "Branch Business Scope"),
        BusinessScopeViewModel(title: "Guarantee Business Scope")
        
    ]
}

struct BusinessAccordionViewModel: Identifiable {
    let id = UUID()
    let title: String
    let details: String
}

extension BusinessAccordionViewModel{
    static let businessAccordionDetails = [
        BusinessAccordionViewModel(title: "Scope", details: "-"),
        BusinessAccordionViewModel(title: "Gurantee Fee", details: "-")
    ]
}
