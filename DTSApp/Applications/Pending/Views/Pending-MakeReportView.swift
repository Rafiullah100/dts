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
    
//    func toggle() {
//        switch self {
//        case .basicInformation:
//            self = .none
//            case .contactInformation
//            case .none
//        }
//    }
}

struct Pending_MakeReportView: View {
    @State var inspectionReportField = ""
    @State var inspectionCompilanceField = ""
    @State var expendedSection: AccordionsDataExpension = .none
    @State var showMenu: Bool
    
    var body: some View {
        
        ScrollView {
            ZStack(alignment: .top) {
                ReportsMenuBar(MenuBarTile: "Make Report", showMenu: $showMenu)
                    .zIndex(showMenu ? 2 : 0)
    //            ScrollView {
                    VStack(alignment: .leading) {
                       
                        ReivewAndRemark
                            .padding()
                        InspectionReport
                            .padding()
                        
                        VStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        expendedSection = expendedSection == .basicInformation ? .none : .basicInformation
                                    }
                                }, label: {
                                    HStack {
                                        Image(expendedSection == .basicInformation ? "drop-up" : "drop-down")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                        Text("Basic Information")
                                            .font(.custom("Poppins", size: 18))
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                })
                                .foregroundColor(.black)
                                
                                if expendedSection == .basicInformation {
                                    VStack(spacing: 14) {
                                        BasicInfo(image: "person", title: "Submitted by:", detail: "Nasir Khan")
                                        BasicInfo(image: "calendar", title: "Submitted Date", detail: "23 March 2023, 02:02 PM")
                                        BasicInfo(image: "district", title: "District:", detail: "Charsadda")
                                        BasicInfo(image: "location-mark", title: "Head Office Adress", detail: "Sher Market Govtt High School No.2, Charsadda")
                                        BasicInfo(image: "location-mark", title: "Postal Adress", detail: "Sher Market Govtt High School No.2, Charsadda")
                                        BasicInfo(image: "phone", title: "Contact Number", detail: "+921 8921731")
                                        BasicInfo(image: "web-icon", title: "Bussiness Website", detail: "www.nil.com")
                                        BasicInfo(image: "email", title: "Bussiness Email", detail: "nil@gmail.com")
                                    }
                                }
                                
                            }
                            .background(Color.theme.ctGray)
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        expendedSection = expendedSection == .contactInformation ? .none : .contactInformation
                                    }
                                }, label: {
                                    HStack {
                                        Image(expendedSection == .contactInformation ? "drop-up" : "drop-down")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                        Text("Contact Inofrmation")
                                            .font(.custom("Poppins", size: 18))
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                })
                                .foregroundColor(.black)
                                
                                if expendedSection == .contactInformation {
                                    VStack(spacing: 14) {
                                        BasicInfo(image: "person", title: "Contact Person:", detail: "Nasir Khan")
                                        BasicInfo(image: "designation-icon", title: "Designation:", detail: "-")
                                        BasicInfo(image: "phone", title: "Mobile Number:", detail: "+921 8921731")
                                        BasicInfo(image: "whatsapp-icon", title: "WhatsApp ID", detail: "-")
                                        BasicInfo(image: "skype-icon", title: "Skype ID", detail: "-")
                                    }
                                }
                                
                            }
                            .background(Color.theme.ctGray)
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        expendedSection = expendedSection == .legalInformation ? .none : .legalInformation
                                    }
                                }, label: {
                                    HStack {
                                        Image(expendedSection == .legalInformation ? "drop-up" : "drop-down")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                        Text("Legal Informaion")
                                            .font(.custom("Poppins", size: 18))
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                })
                                .foregroundColor(.black)
                                
                                if expendedSection == .legalInformation {
                                    VStack(spacing: 14) {
                                        BasicInfo(image: "company-icon", title: "Company Type:", detail: "Sole Proprietorship")
                                        BasicInfo(image: "calendar", title: "Year of Establishment: :", detail: "20-03-2023")
                                        BasicInfo(image: "ragistration-icon", title: "Registration Number:", detail: "3088")
                                        BasicInfo(image: "ntnn-icon", title: "NTNN No.", detail: "17101-2839203-2")
                                    }
                                }
                                
                            }
                            .background(Color.theme.ctGray)
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        expendedSection = expendedSection == .financialInformation ? .none : .financialInformation
                                    }
                                }, label: {
                                    HStack {
                                        Image(expendedSection == .financialInformation ? "drop-up" : "drop-down")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 27, height: 27)
                                        Text("Financial Information")
                                            .font(.custom("Poppins", size: 18))
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                })
                                .foregroundColor(.black)
                                
                                if expendedSection == .financialInformation {
                                    VStack(spacing: 14) {
                                        BasicInfo(image: "rupees-icon", title: "Authorized Capital Rupees:", detail: "9008888")
                                        BasicInfo(image: "rupees-icon", title: "Total Asset Value Rupees:", detail: "9008888")
                                        BasicInfo(image: "person", title: "Auditors Name:", detail: "Charsadda")
                                        BasicInfo(image: "web-icon", title: " Auditor Website:", detail: "www.nil.com")
                                        BasicInfo(image: "email", title: "Auditor Email:", detail: "nil@gmail.com")
                                    }
                                }
                            }
                            .background(Color.theme.ctGray)
                            .padding(.horizontal)
                            
                        }
                    }
                    .padding(.top, 50)
    //            }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Pending_MakeReportView_Previews: PreviewProvider {
    static var previews: some View {
        Pending_MakeReportView(showMenu: false)
    }
}

extension Pending_MakeReportView {
    private var ReivewAndRemark: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("Review & Remark")
                .font(.custom("Poppins", size: 18))
                .fontWeight(.semibold)
            Text("If findings against any options then uncheck")
                .font(.custom("Poppins", size: 12))
                .fontWeight(.regular)
                .foregroundColor(Color.theme.smtFont)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-uncheck")
                    Text("Basic Information")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-check")
                    Text("Contact Information")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-check")
                    Text("Legal Information")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-uncheck")
                    Text("Financial Position")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-check")
                    Text("Physical Position")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-uncheck")
                    Text("Bussiness Scope")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                
                HStack {
                    Image("radio-btn-dots")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.17, height: 15.25)
                    Image("radio-btn-check")
                    Text("Upload Files")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.regular)
                }
                
            }
            .padding(.top)
        }
    }
    
    private var InspectionReport: some View {
        VStack(alignment: .leading) {
            Text("Inspection Report")
                .font(.custom("Poppins", size: 16))
                .fontWeight(.semibold)
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
                    TextField("Inspection Compilance", text: $inspectionCompilanceField)
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding()
            }
            .frame(height: 47)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.2), radius: 3)
            .padding(.top)
            
            Button(action: {}, label: {
                Text("Submit Report")
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
            })
            .frame(width: UIScreen.main.bounds.width * 0.5, height: 34, alignment: .center)
            .background(Color.theme.ctGreen)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 3)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 30)
        }
    }
    
}
