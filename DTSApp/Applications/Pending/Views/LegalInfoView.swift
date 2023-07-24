//
//  LegalInfoView.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import SwiftUI

struct LegalInfoView: View {
    let details = LegalInfoViewModel.DatailsData
    let accordionDetail = AccordionInfoViewModel.AccordionData
    @State private var legalInfo: LegalInfo?
    @State private var legalOnwer: [LegalInfoOwner]?
    @State var businessID: String
    @State private var isExpanded: Bool = true
    
    var body: some View {
        VStack{
            if let legalInfo = legalInfo{
                BasicInfo(image: "company-icon", title: "Company Type:", detail: legalInfo.companyType )
                BasicInfo(image: "calendar", title: "year od Establishment:", detail: legalInfo.dateRegistration )
                BasicInfo(image: "ragistration-icon", title: "Registration Number:", detail: legalInfo.registrationNo )
                BasicInfo(image: "ntnn-icon", title: "NTNN No:", detail: legalInfo.ntn )
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
            URLSession.shared.request(route: .legalInfo, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: LegalInfoModel.self) { result in
                switch result {
                case .success(let info):
                    DispatchQueue.main.async {
                        self.legalInfo = info.legal
                        self.legalOnwer = info.owner
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
//
//struct LegalInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        LegalInfoView()
//    }
//}

extension LegalInfoView{
    
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
                    Text("Ownership Details")
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

                            ForEach(legalOnwer ?? []) { owner in
                                CustomView(item: owner.ownerShipType )
                                CustomView(item: owner.name )
                                CustomView(item: owner.employeeType )
                                CustomView(item: owner.cnic )
                                CustomView(item: "\(owner.sharePercent )")
                                CustomView(item: owner.contactNo )
                                CustomView(item: owner.emailID )

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
                Text("Ownership Details")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            
        }
    }
}


struct CustomView: View {
    let item: String

    var body: some View {
        Text(item)
            .foregroundColor(Color.theme.smtFont)
            .font(.footnote)
            .fontWeight(.regular)
    }
}
