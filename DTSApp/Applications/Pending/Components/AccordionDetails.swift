//
//  AccordionDetails.swift
//  DTSApp
//
//  Created by Macbook on 31/05/2023.
//

import SwiftUI

struct AccordionDetails: View {
    @State private var isExpanded: Bool = false
    let details = PendingApplicationsViewModel.DetailsData
    @State var showMenu: Bool

    var body: some View {
//        NavigationView {
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
            .navigationBarHidden(true)
//        }
    }
}

struct AccordionDetails_Previews: PreviewProvider {
    static var previews: some View {
        AccordionDetails(showMenu: false)
    }
}

 extension AccordionDetails{

    private var accordation: some View {

            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(isExpanded ? "drop-up" : "drop-down")
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
                    ForEach(details) { item in
                        Text(item.title)
                            .foregroundColor(Color.theme.lgtFont)
                            .font(.custom("Poppins", size: 10))
                            .fontWeight(.regular)
                    }
//                    Text("Travel Agency")
//                        .foregroundColor(Color.theme.lgtFont)
//                        .font(.custom("Poppins", size: 10))
//                        .fontWeight(.regular)
//                    Text("April 12, 2023")
//                        .foregroundColor(Color.theme.lgtFont)
//                        .font(.custom("Poppins", size: 10))
//                        .fontWeight(.regular)
//                    Text("New")
//                        .foregroundColor(Color.theme.lgtFont)
//                        .font(.custom("Poppins", size: 10))
//                        .fontWeight(.regular)
//                    Text("For inspection")
//                        .foregroundColor(Color.theme.lgtFont)
//                        .font(.custom("Poppins", size: 10))
//                        .fontWeight(.regular)

                    HStack{
                        NavigationLink(
                            destination: Remarks(showMenu: false),
                            label: {
                                Image("launch-icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 10)
                            })
                        
                        NavigationLink(
                            destination: Pending_MakeReportView(showMenu: showMenu),
                            label: {
                                Image("create-icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10, height: 10)
                            })
                        
                    }
                }
                Spacer()
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
                    Image(isExpanded ?  "drop-up" : "drop-down" )
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
