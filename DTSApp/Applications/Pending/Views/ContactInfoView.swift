//
//  ContactInfoView.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import SwiftUI

struct ContactInfoView: View {
    let details = ContactInfoViewModel.DatailsData
    var body: some View {
        VStack{
            ForEach(details) { item in
                BasicInfo(image: item.icon, title: item.title, detail: item.Detail)
            }
            .padding(.top)
        }
    }
    
    struct ContactInfoView_Previews: PreviewProvider {
        static var previews: some View {
            ContactInfoView()
        }
    }
}
