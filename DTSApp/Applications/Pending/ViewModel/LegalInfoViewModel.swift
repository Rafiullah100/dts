//
//  LegalInfoViewModel.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import Foundation

struct LegalInfoViewModel: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let Detail: String
}

struct  AccordionInfoViewModel: Identifiable {
    let id = UUID()
    let detail: String
}

extension LegalInfoViewModel {
    static let DatailsData = [
        LegalInfoViewModel(icon: "company-icon", title: "Company Type:", Detail: "Sole Proprietorship"),
        LegalInfoViewModel(icon: "calendar", title: "Year od Establishment:", Detail: "20-03-2023"),
        LegalInfoViewModel(icon: "ragistration-icon", title: "Registration Number", Detail: "3088"),
        LegalInfoViewModel(icon: "ntnn-icon", title: "NTNN No", Detail: "11111-1111111-1")
    ]
}

extension AccordionInfoViewModel{
        static let AccordionData = [
            AccordionInfoViewModel(detail: "Sale Propietorship"),
            AccordionInfoViewModel(detail: "Nasir"),
            AccordionInfoViewModel(detail: "Medical Physician"),
            AccordionInfoViewModel(detail: "11111111111"),
            AccordionInfoViewModel(detail: "100"),
            AccordionInfoViewModel(detail: "11111111111"),
            AccordionInfoViewModel(detail: "123@gmail.com")
        ]
}
