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
                        .background(UIColor.theme.ctGray)
                        .cornerRadius(5)
                }
            }
        }
//        .onAppear{
//            print(pendingApplication)
//        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .background(isExpanded ? UIColor.theme.cardBGView : Color.white)
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
                    .foregroundColor(.primary)

                Text("Business Type:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("Inspection End Date:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("Application Type:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("Remarks:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text("Action:")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                
            }
            .padding(.horizontal)
            .padding(.top, 12)
            Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
//                ForEach(details) { item in
                Text(pendingApplication?.businessName ?? "")
                        .foregroundColor(UIColor.theme.smtFont)
                        .font(.footnote)
                        .fontWeight(.regular)
                Text(pendingApplication?.businessType ?? "")
                    .foregroundColor(UIColor.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.inspectionEndDate ?? "" )
                    .foregroundColor(UIColor.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.fileType ?? "")
                    .foregroundColor(UIColor.theme.smtFont)
                    .font(.footnote)
                    .fontWeight(.regular)
                Text(pendingApplication?.remarks ?? "")
                    .foregroundColor(UIColor.theme.smtFont)
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
                        destination: Pending_MakeReportView(showMenu: showMenu, businessID: pendingApplication?.basicInfoID ?? "", recordID: pendingApplication?.recordID ?? 0),
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
                    .foregroundColor(.primary)

                
                
                Text(pendingApplication?.inspectionEndDate ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(UIColor.theme.ctGreen)
            }
        }
    }
}
