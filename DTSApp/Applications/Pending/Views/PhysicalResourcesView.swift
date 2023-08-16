//
//  PhysicalResourcesView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI

enum DataExpansion {
    case vehiclaInfo
    case itDeviceDetails
    case branchDetails
    case employeeDetails
    case none
}

struct PhysicalResourcesView: View {
    @State private var isExpanded: DataExpansion = .none
    @State private var physicalInfo: PhysicalInfoModel?
    @State private var basic: Basic?
    @State private var vheicle: [Vehicle] = []
    @State private var branch: [Branch] = []
    @State var employee: [Employee] = []
    @State private var itDevice: [Itdevice] = []
    @State var businessID: String
    
    let accordionDetails = PhysicalAccordionViewModel .accordionData
    
    var body: some View {
        VStack{
            VStack{
                Text("Total Covered Area")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("\(physicalInfo?.basic?.areaValue ?? 0) sq.m")
                    .foregroundColor(UIColor.theme.smtFont)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    
                    .padding(.top, 2)
                
                Divider().background(UIColor.theme.ctGreen)
            }
            .padding(.horizontal)
            .padding(.top)
            
            VStack{
                Text("no. of Offices/Rooms")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("\(physicalInfo?.basic?.numberOfOffice ?? 0)")
                    .foregroundColor(UIColor.theme.smtFont)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    .padding(.top, 2)
                
                Divider().background(UIColor.theme.ctGreen)
            }
            .padding(.top)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Vehicle Details")
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
                            Text("Vehicle Info")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(vheicle) { item in
                                        CardInsideView(placeHolder: "Vehical Registration No. :", value: item.vehicleRegNo ?? "")
                                        CardInsideView(placeHolder: "Model :", value: item.modelYear ?? "")
                                        CardInsideView(placeHolder: "Vehical Type :", value: item.vehicleTypeID ?? "")
                                        CardInsideView(placeHolder: "Owner :", value: item.vehicleNameOwned ?? "")
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
                            Text("Vehicle Info")
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
                            Text("IT Device Details")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                                .padding(.top, -5)
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(itDevice) { item in
                                        CardInsideView(placeHolder: "Number of Computers :", value: item.numberOfComputers ?? "")
                                        CardInsideView(placeHolder: "Number of Printers :", value: item.numberPrinters ?? "")
                                        CardInsideView(placeHolder: "DSL :", value: item.dsl ?? "")
                                    }
                                }
                                Spacer()
                            }
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
                            Text("IT Device Details")
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
                            Text("Branch Details")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(branch) { item in
                                        CardInsideView(placeHolder: "Branch Name :", value: item.branchName ?? "")
                                        CardInsideView(placeHolder: "Adress :", value: item.branchAddress ?? "")
                                        CardInsideView(placeHolder: "Contact Person :", value: item.contactPerson ?? "")
                                        CardInsideView(placeHolder: "Telephone :", value: item.telephone ?? "")
                                        CardInsideView(placeHolder: "Moblie Number :", value: item.mobile ?? "")
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
                            Text("Branch Details")
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
                            Text("Enmployee Details")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                                .padding(.top, -5)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    ForEach(employee) { item in
                                        CardInsideView(placeHolder: "Employee Name :", value: item.employeeName ?? "")
                                        CardInsideView(placeHolder: "Branch :", value: item.branchName ?? "")
                                        CardInsideView(placeHolder: "Destination :", value: item.designationID ?? "")
                                        CardInsideView(placeHolder: "CNIC :", value: item.cnic ?? "")
                                        CardInsideView(placeHolder: "Qualification :", value: item.qualifacationID ?? "")
                                        CardInsideView(placeHolder: "Experiencre :", value: item.experienceYear ?? "")
                                        CardInsideView(placeHolder: "Contact No. :", value: item.contactNumber ?? "nil")
                                        Divider()
                                            .colorInvert()
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
                            Text("Employee Details")
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
        .onAppear {
            URLSession.shared.request(route: .physicalInfo, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: PhysicalInfoModel.self) { result in
                print("ID", businessID)
                switch result {
                case .success(let info):
                    DispatchQueue.main.async {
                        self.physicalInfo = info
                        self.branch = info.branch ?? []
                        self.vheicle = info.vehicle ?? []
                        self.employee = info.employee ?? []
                        self.itDevice = info.itdevice ?? []
                        print("Model Data", info)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct PhysicalResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalResourcesView(businessID: "")
    }
}
