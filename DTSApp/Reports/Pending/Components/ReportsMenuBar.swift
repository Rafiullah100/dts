//
//  ReportsMenuBar.swift
//  DTS
//
//  Created by Apple  on 17/05/2023.
//

import SwiftUI

struct ReportsMenuBar: View {
    @State var MenuBarTile = ""
    
    
    var body: some View {
        HStack {
            Image("menu-black")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 16.8)
            Spacer()
            Text(MenuBarTile)
                .font(.custom("Poppins", size: 14))
                .fontWeight(.medium)
            Spacer()
            Image("search-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 21)
        }
        .padding()
    }
}

struct ReportsMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        ReportsMenuBar()
    }
}
