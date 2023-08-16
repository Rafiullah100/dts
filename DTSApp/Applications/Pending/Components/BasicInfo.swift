//
//  BasicInfo.swift
//  DTS
//
//  Created by Apple  on 22/05/2023.
//

import SwiftUI

struct BasicInfo: View {
    @State var image = ""
    @State var title = ""
    @State var detail = ""
    @StateObject var basicNetworkModel = BasicNetworkModel()
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 11, height: 11)
                    Text(title)
                        .font(.custom("Poppins", size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                HStack {
                    Text(detail)
                        .font(.custom("Poppins", size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(UIColor.theme.smtFont)
                }
                Divider().background(UIColor.theme.ctGreen)
                
            }
            .padding(.horizontal)
    }
}

struct BasicInfo_Previews: PreviewProvider {
    static var previews: some View {
        BasicInfo()
    }
}
