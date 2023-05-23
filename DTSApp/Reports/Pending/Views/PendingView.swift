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
    @State private var isExpanded: Bool = false
//     @State private var isExpandedSection = 0
    
    
    var body: some View {
        VStack{
            HStack{
                Image("menu")
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
                Image("search")
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
            
            ScrollView{
                VStack(spacing: 20){
                    
                    
//                    ForEach(0 ..< 4) { item in
                    
                        HStack(alignment: .center){
                            
                            if isExpanded {
                                accordation
                                Spacer()
                            }else {
                                accodationTitle

                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                           
                            
                        }
//                    }
                }
                .padding(.top)
                .padding(.bottom)
                .background(isExpanded ? Color.theme.ctGray : Color.white)
                .padding(.horizontal)
                
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

extension PendingView {

    private var accordation: some View {
        HStack(alignment: .center){

            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(isExpanded ? "collapseUp" : "collapseDown")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
            })

                VStack(alignment: .leading, spacing: 15){
                    Text("Business Name:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Business Type:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Inspection End Date:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Application Type:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Remarks:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Action:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)

                }
                .padding(.horizontal)
                Spacer()

                VStack(alignment: .leading, spacing: 15){
                    Text("Adnan Travel and Tours ")
                        .foregroundColor(Color.theme.ctLightGray)
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.regular)
                    Text("Travel Agency")
                        .foregroundColor(Color.theme.ctLightGray)
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.regular)
                    Text("April 12, 2023")
                        .foregroundColor(Color.theme.ctLightGray)
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.regular)
                    Text("New")
                        .foregroundColor(Color.theme.ctLightGray)
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.regular)
                    Text("For inspection")
                        .foregroundColor(Color.theme.ctLightGray)
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.regular)

                    HStack{
                        Image("edit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)

                        Image("document")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                    }


                }
                Spacer()

            }

        }
    }
    
    private var accodationTitle: some View {
        VStack{
            HStack(alignment: .center){
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(isExpanded ?  "collapseUp" : "collapseDown" )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                })
                Text("Inspection date:")
                    .font(.custom("Poppins", size: 10))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                
                Text("13 April 2023")
                    .font(.custom("Poppins", size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.ctGreen)
            }
        
        }
    }
}
