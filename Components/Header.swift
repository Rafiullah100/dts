//
//  Header.swift
//  DTSApp
//
//  Created by Macbook on 22/05/2023.
//

import SwiftUI

struct Header: View {
    var title: String = ""
    var body: some View {
        HStack{
            Image("menu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 17)
            
            Spacer()
            
            Text(title)
                .font(.custom("Poppins", size: 14))
                .fontWeight(.medium)
            Spacer()
            
            Image("hSearch")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
            
        }
        .padding()
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
