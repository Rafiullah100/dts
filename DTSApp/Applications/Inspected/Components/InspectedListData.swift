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
                Text(detail)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.smtFont)
                    .frame(alignment: .leading)
                    
        }
        .padding(8)
            Divider().background(Color.theme.divider)
    }
}

struct InspectedListData_Previews: PreviewProvider {
    static var previews: some View {
        InspectedListData()
    }
}
