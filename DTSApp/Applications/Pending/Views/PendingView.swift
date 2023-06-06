//
//  PendingView.swift
//  DTSApp
//
//  Created by Macbook on 12/05/2023.
//

import SwiftUI

struct PendingView: View {
    @State var searchText = ""
    @State var title = ""
    @State var showMenu = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                
                ReportsMenuBar(MenuBarTile: "Pending Application", showMenu: $showMenu)
                    .zIndex(showMenu ? 2 : 0)
                
                VStack {
                    HStack{
                        Image("search-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 21, height: 21)
                            .padding(5)
                        
                        TextField(title, text: $searchText)
                            .font(.system(size: 13, weight: .light))
                            .padding(5)
                    }
                    .background(Color.theme.ctGray)
                    .padding()
                    
                    AccordionDetails(showMenu: showMenu)
                }
                .padding(.top, 50)
            }
            .navigationBarHidden(true)
        }
    }
}

struct PendingView_Previews: PreviewProvider {
    static var previews: some View {
        PendingView()
    }
}
