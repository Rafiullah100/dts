//
//  InspectedListData.swift
//  DTSApp
//
//  Created by Macbook on 16/06/2023.
//

import SwiftUI

struct InspectedListData: View {
    @State var title = ""
    @State var detail = ""
    var body: some View {
            
        VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text(detail)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.primary)
                    .frame(alignment: .leading)
                    
        }
        .padding(8)
            Divider().background(UIColor.theme.divider)
            .colorInvert()
    }
}

struct InspectedListData_Previews: PreviewProvider {
    static var previews: some View {
        InspectedListData()
    }
}
