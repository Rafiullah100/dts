//
//  ContactInfoView.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import SwiftUI

struct ContactInfoView: View {
    @State private var contactInfo: ContactInfoModel?
    var businessID: String = ""

    var body: some View {
        VStack{
            if let contactInfo = contactInfo{
                BasicInfo(image: "person", title: "Contact Person:", detail: contactInfo.name ?? "")
                BasicInfo(image: "designation-icon", title: "Designation:", detail: contactInfo.designationType ?? "")
                BasicInfo(image: "phone", title: "Mobile Number:", detail: contactInfo.mobileNumber ?? "")
                BasicInfo(image: "whatsapp-icon", title: "WhatsApp ID:", detail: contactInfo.whatsApp ?? "")
                BasicInfo(image: "skype-icon", title: "Skype ID:", detail: contactInfo.skype ?? "")
            }
        }
        .onAppear {
            print(["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID])
            URLSession.shared.request(route: .contactInfo, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0, "basicInfoID": businessID], model: ContactInfoModel.self) { result in
                switch result {
                case .success(let contactInfo):
                    DispatchQueue.main.async {
                        self.contactInfo = contactInfo
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    struct ContactInfoView_Previews: PreviewProvider {
        static var previews: some View {
            ContactInfoView()
        }
    }
}
