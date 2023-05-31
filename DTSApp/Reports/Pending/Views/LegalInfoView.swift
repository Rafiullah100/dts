//
//  LegalInfoView.swift
//  DTSApp
//
//  Created by Macbook on 30/05/2023.
//

import SwiftUI

struct LegalInfoView: View {
    let details = LegalInfoViewModel.DatailsData
    let accordionDetail = AccordionInfoViewModel.AccordionData
    
    @State private var isExpanded: Bool = false
    
    
    var body: some View {
        VStack{
            ForEach(details) { item in
                BasicInfo(image: item.icon, title: item.title, detail: item.Detail)
            }
            .padding(.top)
            
            //            AccordionDetails()
            //                .padding(.top)
            
            VStack(spacing: 20){
                HStack(alignment: .center){
                    
                    if isExpanded {
                        accordation
                        Spacer()
                    }else {
                        accodationTitle
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.top)
                .padding(.bottom)
                .background(isExpanded ? Color.theme.ctGray : Color.white)
                .padding(.horizontal)
                
            }
        }
    }
}

struct LegalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LegalInfoView()
    }
}

extension LegalInfoView{
    
    private var accordation: some View {
        HStack(alignment: .center){
            
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
                
                Text("Ownership Details")
                    .font(.custom("Poppins", size: 15))
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Ownership type:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Name:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Designation:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("CNIC:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Share %:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Contact No.:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    Text("Email:")
                        .font(.custom("Poppins", size: 10))
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal)
                Spacer()
                
                VStack(alignment: .leading, spacing: 15){
                    ForEach(accordionDetail) { item in
                        Text(item.detail)
                            .foregroundColor(Color.theme.lgtFont)
                            .font(.custom("Poppins", size: 10))
                            .fontWeight(.regular)
                    }
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
                    Image(isExpanded ?  "drop-up" : "drop-down" )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                })
                Text("Ownership Details")
                    .font(.custom("Poppins", size: 10))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            
        }
    }
}

