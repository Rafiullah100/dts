//
//  SideMenuOptionRowView.swift
//  DTSApp
//
//  Created by Apple  on 31/05/2023.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 16)
            Text(viewModel.title)
                .font(.custom("Poppins", size: 18))
                .fontWeight(.regular)
                .foregroundColor(Color.theme.smtFont)
        }
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .pending)
    }
}
