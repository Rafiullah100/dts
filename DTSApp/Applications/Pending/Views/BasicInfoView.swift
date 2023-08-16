//
//  BasicInfoView.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import SwiftUI

struct BasicInfoView: View {
//    @StateObject var basicNetworkModel = BasicNetworkModel()
    @State private var basicInfo: BasicInfoModel?
    @State var businessID: String

    var body: some View {
        //            ForEach(details) { item in
        VStack {
            if let basicInfo = basicInfo{
                BasicInfo(image: "person", title: "Submitted BY:", detail: basicInfo.submittedby ?? "")
                BasicInfo(image: "calendar", title: "Submitted Date:", detail: basicInfo.regDateTime ?? "")
                BasicInfo(image: "district", title: "District", detail: basicInfo.district ?? "")
                BasicInfo(image: "location-mark", title: "Head Office Address", detail: basicInfo.headofficeAddress ?? "")
                BasicInfo(image: "location-mark", title: "Postal Address", detail: basicInfo.postalofficeAddress ?? "")
                BasicInfo(image: "phone", title: "Contact Number", detail: basicInfo.mobileNumber ?? "")
//                BasicInfo(image: "web-icon", title: "Business", detail: basicInfo.businessName ?? "")
                BasicInfo(image: "web-icon", title: "Business Website", detail: basicInfo.website ?? "")
                BasicInfo(image: "email", title: "Business Email", detail: basicInfo.emailID ?? "")
            }
        }
        .onAppear {
            URLSession.shared.request(route: .basicInfo, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: BasicInfoModel.self) { result in
                switch result {
                case .success(let basicInfo):
                    DispatchQueue.main.async {
                        self.basicInfo = basicInfo
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}


//struct BasicInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        BasicInfoView()
//            .previewLayout(.sizeThatFits)
//    }
//}
