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
    let pendingApplication: PendingApplicationsModel?

    var body: some View {
        VStack(spacing: 20){
            HStack(alignment: .center){
                
                if isExpanded {
                    accordation
                    Spacer()
                }else {
                    accodationTitle
                        .padding(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.theme.ctGray)
                        .cornerRadius(5)
                }
            }
        }
//        .onAppear{
//            print(pendingApplication)
//        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .background(isExpanded ? Color.theme.ctGray : Color.white)
        .cornerRadius(5)
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

//struct AccordionDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        AccordionDetails(showMenu: false)
//    }
//}

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
                    .padding(.leading, 5)
            })
            .padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Business Name:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Business Type:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Inspection End Date:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Application Type:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Remarks:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Action:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
            }
            .padding(.horizontal)
            .padding(.top, 12)
            Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
//                ForEach(details) { item in
                Text(pendingApplication?.businessName ?? "")
                        .foregroundColor(Color.theme.smtFont)
                        .font(.footnote)
                        .fontWeight(.regular)
                Text(pendingApplication?.businessType ?? "")
                    .foregroundColor(Color.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.inspectionEndDate ?? "" )
                    .foregroundColor(Color.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.fileType ?? "")
                    .foregroundColor(Color.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.remarks ?? "")
                    .foregroundColor(Color.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                
                HStack{
                    NavigationLink(
                        destination: Remarks(showMenu: false, businessID: pendingApplication?.basicInfoID ?? ""),
                        label: {
                            Image("launch-icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                        })
                    
                    NavigationLink(
                        destination: Pending_MakeReportView(showMenu: showMenu),
                        label: {
                            Image("create-icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                        })
                    
                }
            }
            .padding(.top, 12)
            .padding(.bottom)
            
//            .onAppear{
//                print(pendingApplication)
//            }
            
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
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                
                Text(pendingApplication?.inspectionEndDate ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.ctGreen)
            }
        }
    }
}
