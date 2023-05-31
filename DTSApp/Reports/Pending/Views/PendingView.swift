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
    
    var body: some View {
        VStack{
            HStack{
                Image("menu-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 17)
                
                Spacer()
                
                Text("Pending Applications")
                    .font(.custom("Poppins", size: 13))
                    .fontWeight(.medium)
                Spacer()
                
                Image("notification")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 20)
                
            }
            .padding()
            
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
            
            
            Spacer()
            
            ScrollView(showsIndicators: false){
                
                ForEach(0 ..< 4) { item in
                    AccordionDetails()
                        Divider()
                }
            }
        }
    }
}
//    func toggleOptionalInt() {
//        isExpandedSection = isExpandedSection.map { $0 == 0 ? 1 : 0 }
//        }


struct PendingView_Previews: PreviewProvider {
    static var previews: some View {
        PendingView()
    }
}
