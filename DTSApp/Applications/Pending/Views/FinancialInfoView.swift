//
//  FinancialInfoView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI

struct FinancialInfoView: View {
    let details = FinancialInfoViewModel.DatailsData
    let accordionDetail = AccordionViewModel.AccordionData
    
    @State private var financialInfo: FinancialInfo?
    @State private var bank: [Bank]?
    @State private var isExpanded: Bool = false
    @State var businessID: String

    

    var body: some View {
        VStack{
            if let financialInfo = financialInfo {
                BasicInfo(image: "rupees-icon", title: "Authorized Capital Rupees", detail: financialInfo.authorizedCapitalRupees)
                BasicInfo(image: "rupees-icon", title: "Total Asset Value Rupees", detail: "\(financialInfo.totalAsset)")
                BasicInfo(image: "person", title: "Auditors Name", detail: financialInfo.name)
                BasicInfo(image: "phone", title: "Auditor Contact", detail: financialInfo.telephoneNumber)
                BasicInfo(image: "web-icon", title: "Auditor Website", detail: financialInfo.website)
                BasicInfo(image: "email", title: "Auditor Email", detail: financialInfo.email)
            }
            
            VStack(spacing: 20){
                HStack(alignment: .center){
                    
                    if isExpanded {
                        accordation
                        Spacer()
                    }else {
                        accodationTitle
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.theme.ctGray)
                            .cornerRadius(5)
                    }
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                .background(isExpanded ? Color.theme.ctGray : Color.white)
                .cornerRadius(5)
                .padding(.horizontal)
                
            }
            .padding(.top)
        }
        .onAppear {
            URLSession.shared.request(route: .financialInfo, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: FinancialInfoModel.self) { result in
                switch result {
                case .success(let info):
                    DispatchQueue.main.async {
                        self.financialInfo = info.financial
                        self.bank = info.bank
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

//struct FinancialInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinancialInfoView()
//    }
//}

extension FinancialInfoView{
    private var accordation: some View {
//        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(isExpanded ? "drop-up" : "drop-down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                }
                .padding(.horizontal, 5)
                .padding(.top, -8)
                
                VStack(alignment: .leading) {
                    Text("Bank Details")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, -5)
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Ownership type:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Name:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Designation:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("CNIC:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Share %:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Contact No.:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Email:")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {

                            ForEach(bank ?? []) { items in
                                CustomTextView(item: items.accountNumber ?? "")
                                CustomTextView(item: items.accountTitle ?? "")
                                CustomTextView(item: items.bankName ?? "")
                                CustomTextView(item: items.branchCode ?? "")
                                CustomTextView(item: "\(items.bankDetailID ?? 0)")
                                CustomTextView(item: items.bankName ?? "")
                                CustomTextView(item: items.branchCode ?? "")
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                }
            }
            .padding(.top, 12)
            .padding(.bottom)
//        }
    }
    
    private var accodationTitle: some View {
        VStack{
            HStack(alignment: .center){
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(isExpanded ?  "drop-up" : "drop-down" )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                })
                Text("Bank Details")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)

            }
            
        }
    }
}

struct CustomTextView: View {
    let item: String

    var body: some View {
        Text(item)
            .foregroundColor(Color.theme.smtFont)
            .font(.footnote)
            .fontWeight(.regular)
    }
}
