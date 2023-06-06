//
//  BasicInfoView.swift
//  DTSApp
//
//  Created by Macbook on 29/05/2023.
//

import SwiftUI

struct BasicInfoView: View {
    let details = BasicInfoViewModel.DatailsData
    
    var body: some View {
        VStack{
            ForEach(details) { item in
                BasicInfo(image: item.icon, title: item.title, detail: item.Detail)
                    
//                    .padding(.top)
            }
            
        }
    }
}

struct BasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BasicInfoView()
            .previewLayout(.sizeThatFits)
    }
}
