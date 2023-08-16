//
//  Remarks.swift
//  DTSApp
//
//  Created by Macbook on 22/05/2023.
//

import SwiftUI

struct Remarks: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var showMenu: Bool
    @State private var selectedFilter: detailFormtab = .remarks
    @State var businessID: String
    var body: some View {
        
        VStack{
            HStack {
                Button(action: {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Image("home-back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 16.8)
                })
                Spacer()
                Text("Details Form")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.primary)

                Spacer()
                Image("notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 24)
            }
            .padding()
            
            
                VStack {
                    filterView(selectedFilter: $selectedFilter)
                    ScrollView {
                    switch selectedFilter {
                    case .remarks :
                        RemarksDetails(businessID: businessID)
                    case .basicInfo:
                        BasicInfoView(businessID: businessID)
                    case .contactInfo:
                        ContactInfoView(businessID: businessID)
                    case .legalInfo:
                        LegalInfoView(businessID: businessID)
                    case .financialInfo:
                        FinancialInfoView(businessID: businessID)
                    case .physicalResources:
                        PhysicalResourcesView(businessID: businessID)
                    case .businessScope:
                        BusinessScopeView(businessID: businessID)
                    case .uploadFiles: 
                        UploadedFilesView(businessID: businessID)
                    
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

//struct Remarks_Previews: PreviewProvider {
//    static var previews: some View {
//        Remarks(showMenu: false, businessID: businessID)
//    }
//}

//struct filterView: View {
//    @Binding var selectedFilter: detailFormtab
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            ScrollViewReader { scrollViewProxy in
//                HStack(spacing: 20) {
//                    ForEach(detailFormtab.allCases, id: \.rawValue) { item in
//                        VStack(alignment: .center) {
//                            Text(item.title)
//                                .font(.custom("Poppins", size: 18))
//                                .fontWeight(.semibold)
//                                .foregroundColor(selectedFilter == item ? .black : Color.theme.lgtFont)
//                                .onTapGesture {
//                                    withAnimation {
//                                        self.selectedFilter = item
//                                    }
//                                    if item != .uploadFiles {
//                                        scrollViewProxy.scrollTo(item, anchor: .center)
//                                    }
//                                }
//
//                            if selectedFilter == item {
//                                Circle()
//                                    .foregroundColor(Color.theme.ctGreen)
//                                    .frame(height: 4.5)
//                            } else {
//                                Circle()
//                                    .foregroundColor(Color.clear)
//                                    .frame(height: 4.5)
//                            }
//                        }
//                        .padding(.horizontal)
//                        .fixedSize()
//                        .id(item)
//                    }
//                }
//                .padding(.top)
//                .onAppear {
//                    scrollViewProxy.scrollTo(selectedFilter, anchor: .center)
//                }
//            }
//        }
//    }
//}

struct FilterTabItemView: View {
    var title: String
    var isSelected: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.custom("Poppins", size: 18))
                .fontWeight(.semibold)
                .foregroundColor(isSelected ? .primary : UIColor.theme.lgtFont)
            
            Circle()
                .foregroundColor(isSelected ? UIColor.theme.ctGreen : Color.clear)
                .frame(height: 4.5)
        }
        .padding(.horizontal)
        .fixedSize()
    }
}


struct filterView: View {
    @Binding var selectedFilter: detailFormtab
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                HStack(spacing: 20) {
                    ForEach(detailFormtab.allCases, id: \.rawValue) { item in
                        FilterTabItemView(title: item.title, isSelected: selectedFilter == item)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedFilter = item
                                }
                                if item != .uploadFiles {
                                    scrollViewProxy.scrollTo(item, anchor: .center)
                                }
                            }
                            .id(item)
                    }
                }
                .padding(.top)
                .onAppear {
                    scrollViewProxy.scrollTo(selectedFilter, anchor: .center)
                }
            }
        }
    }
}



struct RemarksDetails: View {
    @State var businessID: String
    @State private var remarks: RemarksModel?
    @State private var dateString: String = ""
    @State private var timeString: String = ""
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                Text("Visit Date")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                HStack {
                    Image("calendar-light")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Image("line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 1, height: 28)
                    Text(remarks?.uploads.inspectionEndDate ?? "")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(UIColor.theme.remarksColor)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.2), radius: 3)
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("Application Remarks")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                
                HStack {
                    Text(remarks?.uploads.remarks ?? "")
                        .font(.custom("Poppins", size: 10))
                        .foregroundColor(.primary)

                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(UIColor.theme.remarksColor)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.2), radius: 3)
            }
            
            .padding()
            
            VStack{
                HStack{
                    Button(action: {}, label: {
                        Text("Send Email")
                            .font(.custom("Poppins", size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)

                    })
                    .frame(width: 95, height: 34)
                    .foregroundColor(.white)
                    .background(UIColor.theme.ctGreen)
                    .cornerRadius(3)
                    Button(action: {}, label: {
                        Text("Send Email")
                            .font(.custom("Poppins", size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    })
                    .frame(width: 107, height: 34)
                    .foregroundColor(.white)
                    .background(UIColor.theme.ctLightBlue)
                    .cornerRadius(3)
                }
            }
        }
        .onAppear{
            URLSession.shared.request(route: .remarks, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: RemarksModel.self) { result in
                switch result {
                case .success(let remarks):
                    DispatchQueue.main.async {
                        self.remarks = remarks
                        self.dateString = self.datetoString(strDate: self.remarks?.uploads.inspectionEndDate ?? "")
                        self.timeString = self.timetoString(strDate: self.remarks?.uploads.inspectionEndDate ?? "")
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
    func datetoString(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: strDate) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "d MMM yyyy"
            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
    
    func timetoString(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: strDate) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "hh:mm a"
            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
        
    }
}
