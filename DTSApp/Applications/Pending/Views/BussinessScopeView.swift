//
//  bussinesTest.swift
//  DTSApp
//
//  Created by Macbook on 26/07/2023.
//

import SwiftUI

enum DataExpansions {
    case vehiclaInfo
    case itDeviceDetails
    case branchDetails
    case employeeDetails
    case none
}

struct BusinessScopeView: View {
    @State var isExpanded: DataExpansions = .none
    @State var BussinesScope: BussinessScopeModel?
    @State var branch: [BussinessScopeBranch]?
    @State var branchGuarantee: [BussinessScopeBranchguarantee]?
    @State var main: [BussinessScopeMain]?
    @State var mainGuarantee: [BussinessScopeMainguarantee]?
    @State var businessID: String
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Main Office Bussiness Scope ")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                if isExpanded == .vehiclaInfo {
                    HStack(alignment: .top) {
                        Button(action: {
                            withAnimation {
                                isExpanded = isExpanded == .vehiclaInfo ? .none : .vehiclaInfo
                            }
                        }) {
                            Image(isExpanded == .vehiclaInfo ? "drop-up" : "drop-down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        }
                        .padding(.horizontal, 5)
                        .padding(.top, -8)
                        
                        VStack(alignment: .leading) {
                            Text("Main Office Bussiness Scope")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(main ?? []) { item in
                                        CardInsideView(placeHolder: "Scope :", value: item.scope ?? "")
                                        CardInsideView(placeHolder: "Guarantee Fee :", value: "\(item.renewalFeeForMainOffice ?? 0)")
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.bottom)
                    .background(UIColor.theme.ctGray)
                } else {
                    VStack {
                        HStack(alignment: .center){
                            Button(action: {
                                withAnimation {
                                    isExpanded = isExpanded == .vehiclaInfo ? .none : .vehiclaInfo
                                }
                            }, label: {
                                Image(isExpanded == .vehiclaInfo ?  "drop-up" : "drop-down" )
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                            })
                            Text("Main Office Bussines Scope")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.horizontal)
                        }
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(UIColor.theme.ctGray)
                    .cornerRadius(5)
                }
                
                if isExpanded == .itDeviceDetails {
                    HStack(alignment: .top) {
                        Button(action: {
                            withAnimation {
                                isExpanded = isExpanded == .itDeviceDetails ? .none : .itDeviceDetails
                            }
                        }) {
                            Image(isExpanded == .itDeviceDetails ? "drop-up" : "drop-down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        }
                        .padding(.horizontal, 5)
                        .padding(.top, -8)

                        VStack(alignment: .leading) {
                            Text("Main Guarantee Bussiness Scope")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(mainGuarantee ?? []) { item in
                                        CardInsideView(placeHolder: "Scope :", value: item.scope ?? "")
                                        CardInsideView(placeHolder: "Guarantee Fee :", value: "\(item.guaranteeFeeForMainOffice ?? 0)")
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.top)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.bottom)
                    .background(UIColor.theme.ctGray)
                } else {
                    VStack {
                        HStack(alignment: .center){
                            Button(action: {
                                withAnimation {
                                    isExpanded = isExpanded == .itDeviceDetails ? .none : .itDeviceDetails
                                }
                            }, label: {
                                Image(isExpanded == .itDeviceDetails ? "drop-up" : "drop-down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                            })
                            Text("Branch Bussiness Scope")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.horizontal)
                        }
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(UIColor.theme.ctGray)
                    .cornerRadius(5)
                }
                
                if isExpanded == .branchDetails {
                    HStack(alignment: .top) {
                        Button(action: {
                            withAnimation {
                                isExpanded = isExpanded == .branchDetails ? .none : .branchDetails
                            }
                        }) {
                            Image(isExpanded == .branchDetails ? "drop-up" : "drop-down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        }
                        .padding(.horizontal, 5)
                        .padding(.top, -8)

                        VStack(alignment: .leading) {
                            Text("Branch Bussiness Scope")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(branchGuarantee ?? []) { item in
                                        CardInsideView(placeHolder: "Scope :", value: item.scope ?? "")
                                        CardInsideView(placeHolder: "Head Office Renewel Fee :", value: "\(item.guaranteeFeeForBranchOffice ?? 0)")
                                        CardInsideView(placeHolder: "Total Branches :", value: item.totalBranches ?? "nil")
                                        CardInsideView(placeHolder: "Total Fee :", value: item.totalAmount ?? "nil")
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.bottom)
                    .background(UIColor.theme.ctGray)
                } else {
                    VStack {
                        HStack(alignment: .center){
                            Button(action: {
                                withAnimation {
                                    isExpanded = isExpanded == .branchDetails ? .none : .branchDetails
                                }
                            }, label: {
                                Image(isExpanded == .branchDetails ?  "drop-up" : "drop-down" )
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                            })
                            Text("Branch Bussiness Scope")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.horizontal)
                        }
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(UIColor.theme.ctGray)
                    .cornerRadius(5)
                }
                    
                if isExpanded == .employeeDetails {
                    HStack(alignment: .top) {
                        Button(action: {
                            withAnimation {
                                isExpanded = isExpanded == .employeeDetails ? .none : .employeeDetails
                            }
                        }) {
                            Image(isExpanded == .employeeDetails ? "drop-up" : "drop-down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                        }
                        .padding(.horizontal, 5)
                        .padding(.top, -8)

                        VStack(alignment: .leading) {
                            Text("Gurantee Bussiness Scope")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(branch ?? []) { item in
                                        CardInsideView(placeHolder: "Scope :", value: item.scope ?? "")
                                        CardInsideView(placeHolder: "Guarantee Fee :", value: "\(item.licenseFeeForBranchOffice ?? 0)")
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.bottom)
                    .background(UIColor.theme.ctGray)
                } else {
                    VStack {
                        HStack(alignment: .center){
                            Button(action: {
                                withAnimation {
                                    isExpanded = isExpanded == .employeeDetails ? .none : .employeeDetails
                                }
                            }, label: {
                                Image(isExpanded == .employeeDetails ? "drop-up" : "drop-down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 27, height: 27)
                            })
                            Text("Gurantee Bussiness Scope")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.horizontal)
                        }
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(UIColor.theme.ctGray)
                    .cornerRadius(5)
                }
                
            }
            .padding(.top)
            .padding(.top, 5)
            .padding(.bottom, 5)
            .cornerRadius(5)
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear{
            URLSession.shared.request(route: .bussinessScope, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": "Business31828"], model: BussinessScopeModel.self) { result in
                switch result {
                case .success(let info):
//                    DispatchQueue.main.async {
                    
                    self.branch = info.branch ?? []
                    self.branchGuarantee = info.branchguarantee ?? []
                    self.main = info.main ?? []
                    self.mainGuarantee = info.mainguarantee ?? []
                    print(self.branchGuarantee ?? [])
                    
//                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

//struct bussinesTest_Previews: PreviewProvider {
//    static var previews: some View {
//        bussinesTest()
//    }
//}


struct BussinessTextView: View {
    let item: String

    var body: some View {
        Text(item)
            .foregroundColor(UIColor.theme.lgtFont)
            .font(.footnote)
            .fontWeight(.regular)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
