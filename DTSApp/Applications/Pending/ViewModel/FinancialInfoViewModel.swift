//
//  FinancialInfoViewModel.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import Foundation

struct FinancialInfoViewModel: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let Detail: String
}

extension FinancialInfoViewModel {
    static let DatailsData = [
        FinancialInfoViewModel(icon: "rupees-icon", title: "Authorized Capital Rupees", Detail: "900888"),
        FinancialInfoViewModel(icon: "rupees-icon", title: "Total Asset Value Rupees", Detail: "9099990"),
        FinancialInfoViewModel(icon: "person", title: "Auditors Name", Detail: "Nasir Khan"),
        FinancialInfoViewModel(icon: "phone", title: "Auditor Contact", Detail: "0000000000"),
        FinancialInfoViewModel(icon: "web-icon", title: "Auditor Website", Detail: "www.nil.com"),
        FinancialInfoViewModel(icon: "email", title: "Auditor Email", Detail: "123@gmail.com")
    ]
}

struct  AccordionViewModel: Identifiable {
    let id = UUID()
    let detail: String
}

extension AccordionViewModel{
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
