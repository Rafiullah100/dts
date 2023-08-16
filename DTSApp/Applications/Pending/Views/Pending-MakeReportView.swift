//
//  Pending-MakeReportView.swift
//  DTS
//
//  Created by Apple  on 17/05/2023.
//

import SwiftUI

enum AccordionsDataExpension {
    case basicInformation
    case contactInformation
    case legalInformation
    case financialInformation
    case none
    
}

struct Pending_MakeReportView: View {
    @State var inspectionReportField = ""
    @State var inspectionCompilanceField = ""
    @State var expendedSection: AccordionsDataExpension = .none
    @State var showMenu: Bool
    @State private var radioToggles = Array(repeating: false, count: 7)
    @State var businessID: String
    @State var recordID: Int
    @State private var selectedOption = "Inspection Compliance"
    @State private var showAlert = false
    @State private var alertmessage = ""

    
    var body: some View {
        
        ZStack(alignment: .top) {
            ReportsMenuBar(MenuBarTile: "Make Report", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ReivewAndRemark
                        .padding()
                    InspectionReport
                        .padding()
                    
//                    VStack(spacing: 20) {
//                        VStack(alignment: .leading, spacing: 0) {
//                            Button(action: {
//                                withAnimation {
//                                    expendedSection = expendedSection == .basicInformation ? .none : .basicInformation
//                                }
//                            }, label: {
//                                HStack {
//                                    Image(expendedSection == .basicInformation ? "drop-up" : "drop-down")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 27, height: 27)
//                                    Text("Basic Information")
//                                        .font(.custom("Poppins", size: 18))
//                                        .fontWeight(.semibold)
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                            })
//                            .foregroundColor(.black)
//
//                            if expendedSection == .basicInformation {
//                                VStack(spacing: 14) {
//                                    BasicInfo(image: "person", title: "Submitted by:", detail: "Nasir Khan")
//                                    BasicInfo(image: "calendar", title: "Submitted Date", detail: "23 March 2023, 02:02 PM")
//                                    BasicInfo(image: "district", title: "District:", detail: "Charsadda")
//                                    BasicInfo(image: "location-mark", title: "Head Office Adress", detail: "Sher Market Govtt High School No.2, Charsadda")
//                                    BasicInfo(image: "location-mark", title: "Postal Adress", detail: "Sher Market Govtt High School No.2, Charsadda")
//                                    BasicInfo(image: "phone", title: "Contact Number", detail: "+921 8921731")
//                                    BasicInfo(image: "web-icon", title: "Bussiness Website", detail: "www.nil.com")
//                                    BasicInfo(image: "email", title: "Bussiness Email", detail: "nil@gmail.com")
//                                }
//                            }
//
//                        }
//                        .background(UIColor.theme.ctGray)
//                        .padding(.horizontal)
//
//                        VStack(alignment: .leading, spacing: 0) {
//                            Button(action: {
//                                withAnimation {
//                                    expendedSection = expendedSection == .contactInformation ? .none : .contactInformation
//                                }
//                            }, label: {
//                                HStack {
//                                    Image(expendedSection == .contactInformation ? "drop-up" : "drop-down")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 27, height: 27)
//                                    Text("Contact Inofrmation")
//                                        .font(.custom("Poppins", size: 18))
//                                        .fontWeight(.semibold)
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                            })
//                            .foregroundColor(.black)
//
//                            if expendedSection == .contactInformation {
//                                VStack(spacing: 14) {
//                                    BasicInfo(image: "person", title: "Contact Person:", detail: "Nasir Khan")
//                                    BasicInfo(image: "designation-icon", title: "Designation:", detail: "-")
//                                    BasicInfo(image: "phone", title: "Mobile Number:", detail: "+921 8921731")
//                                    BasicInfo(image: "whatsapp-icon", title: "WhatsApp ID", detail: "-")
//                                    BasicInfo(image: "skype-icon", title: "Skype ID", detail: "-")
//                                }
//                            }
//
//                        }
//                        .background(UIColor.theme.ctGray)
//                        .padding(.horizontal)
//
//                        VStack(alignment: .leading, spacing: 0) {
//                            Button(action: {
//                                withAnimation {
//                                    expendedSection = expendedSection == .legalInformation ? .none : .legalInformation
//                                }
//                            }, label: {
//                                HStack {
//                                    Image(expendedSection == .legalInformation ? "drop-up" : "drop-down")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 27, height: 27)
//                                    Text("Legal Informaion")
//                                        .font(.custom("Poppins", size: 18))
//                                        .fontWeight(.semibold)
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                            })
//                            .foregroundColor(.black)
//
//                            if expendedSection == .legalInformation {
//                                VStack(spacing: 14) {
//                                    BasicInfo(image: "company-icon", title: "Company Type:", detail: "Sole Proprietorship")
//                                    BasicInfo(image: "calendar", title: "Year of Establishment: :", detail: "20-03-2023")
//                                    BasicInfo(image: "ragistration-icon", title: "Registration Number:", detail: "3088")
//                                    BasicInfo(image: "ntnn-icon", title: "NTNN No.", detail: "17101-2839203-2")
//                                }
//                            }
//
//                        }
//                        .background(UIColor.theme.ctGray)
//                        .padding(.horizontal)
//
//                        VStack(alignment: .leading, spacing: 0) {
//                            Button(action: {
//                                withAnimation {
//                                    expendedSection = expendedSection == .financialInformation ? .none : .financialInformation
//                                }
//                            }, label: {
//                                HStack {
//                                    Image(expendedSection == .financialInformation ? "drop-up" : "drop-down")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 27, height: 27)
//                                    Text("Financial Information")
//                                        .font(.custom("Poppins", size: 18))
//                                        .fontWeight(.semibold)
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                            })
//                            .foregroundColor(.black)
//
//                            if expendedSection == .financialInformation {
//                                VStack(spacing: 14) {
//                                    BasicInfo(image: "rupees-icon", title: "Authorized Capital Rupees:", detail: "9008888")
//                                    BasicInfo(image: "rupees-icon", title: "Total Asset Value Rupees:", detail: "9008888")
//                                    BasicInfo(image: "person", title: "Auditors Name:", detail: "Charsadda")
//                                    BasicInfo(image: "web-icon", title: " Auditor Website:", detail: "www.nil.com")
//                                    BasicInfo(image: "email", title: "Auditor Email:", detail: "nil@gmail.com")
//                                }
//                            }
//                        }
//                        .background(UIColor.theme.ctGray)
//                        .padding(.horizontal)
//
//                    }
                }
                
            }
            .padding(.top, 50)
            .navigationBarHidden(true)
        }
    }
}

//struct Pending_MakeReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        Pending_MakeReportView(showMenu: false)
//    }
//}

extension Pending_MakeReportView {
    private var ReivewAndRemark: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("Review & Remark")
                .font(.custom("Poppins", size: 18))
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            Text("If findings against any options then uncheck")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(UIColor.theme.smtFont)
            VStack(alignment: .leading, spacing: 12) {
                ForEach(0..<radioToggles.count) { index in
                    HStack {
                        Image("radio-btn-dots")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 7.17, height: 15.25)
                        
                        Button(action: {
                            withAnimation {
                                radioToggles[index].toggle()
                            }
                        }) {
                            Image(radioToggles[index] ? "radio-btn-check" : "radio-btn-uncheck")
                        }
                        
                        Text(buttonTitle(for: index))
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(.primary)

                    }
                }
            }
            .padding(.top)
        }
    }
    
    func buttonTitle(for index: Int) -> String {
        switch index {
        case 0:
            return "Basic Information"
        case 1:
            return "Contact Information"
        case 2:
            return "Legal Information"
        case 3:
            return "Financial Position"
        case 4:
            return "Physical Position"
        case 5:
            return "Business Scope"
        case 6:
            return "Upload Files"
        default:
            return ""
        }
    }
    
    private var InspectionReport: some View {
        VStack(alignment: .center) {
            Text("Inspection Report")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.primary)

                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                TextField("Type your inspection report here", text: $inspectionReportField)
                    .padding()
            }
            .frame(height: 124, alignment: .top)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.2), radius: 3)
    
           
            HStack {
                HStack {
                    PickerView(selectedOption: $selectedOption)
                }
                .padding()
            }
            .frame(height: 47)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.2), radius: 3)
            .padding(.top)
            
            Button(action: {
                let basicInfo = radioToggles[0] == true ? "Okay" : "Findings"
                let contactInfo = radioToggles[1] == true ? "Okay" : "Findings"
                let legal = radioToggles[2] == true ? "Okay" : "Findings"
                let financial = radioToggles[3] == true ? "Okay" : "Findings"
                let physical = radioToggles[4] == true ? "Okay" : "Findings"
                let Scope = radioToggles[5] == true ? "Okay" : "Findings"
                let files = radioToggles[6] == true ? "Okay" : "Findings"
                let para = ["BasicInfo": basicInfo, "ContactInfo": contactInfo, "Legal": legal, "Financial":financial, "Physical": physical, "Scope": Scope, "Files": files, "Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID, "Remarks": inspectionReportField, "RecordId": recordID, "InspectionStatus": selectedOption] as [String : Any]
                URLSession.shared.request(route: .makeReport, method: .post, parameters: para, model: MakeReportModel.self) { result in
                    switch result {
                    case .success(let report):
                        DispatchQueue.main.async {
                            if report.message == "Operation Successfully Performed"{
                                alertmessage = "Operation Successfully Performed"
                                showAlert = true
                            }
                        }
                    case .failure(let error):
                        alertmessage = error.localizedDescription
                        showAlert = true
                    }
                }
                
            }, label: {
                Text("Submit Report")
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

            })
            .frame(width: UIScreen.main.bounds.width * 0.5, height: 34, alignment: .center)
            .background(UIColor.theme.ctGreen)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 3)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 30)
            
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(""),
                    message: Text(alertmessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            NavigationLink(
                destination: Remarks(showMenu: false, businessID: businessID),
                label: {
                    Text("View details")
                        .foregroundColor(.primary)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                }
            )
            .frame(width: UIScreen.main.bounds.width * 0.5, height: 34, alignment: .center)
            .background(UIColor.theme.ctGreen)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 3)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)
        }
    }
}

struct PickerView: View {
    @Binding var selectedOption: String
    let options = ["Inspection Compliance", "Recommended", "NonRecommended"]

    var body: some View {
        VStack {
            Picker("", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .foregroundColor(.black)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .foregroundColor(.black)
        }
        .padding()
    }
}


