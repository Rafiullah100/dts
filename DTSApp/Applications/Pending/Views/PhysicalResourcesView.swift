//
//  PhysicalResourcesView.swift
//  DTSApp
//
//  Created by Apple on 20/06/2023.
//

import SwiftUI

struct PhysicalResourcesView: View {
    @State private var isExpanded: Bool = false
    
    let accordionDetails = PhysicalAccordionViewModel .accordionData

    var body: some View {
        VStack{
            VStack{
                Text("Total Covered Area")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                
                Text("12345 sq.m")
                    .foregroundColor(Color.theme.smtFont)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    
                    .padding(.top, 2)
                
                Divider().background(Color.theme.ctGreen)
            }
            .padding(.horizontal)
            .padding(.top)

            VStack{
                Text("Total Covered Area")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                
                Text("12345 sq.m")
                    .foregroundColor(Color.theme.smtFont)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.regular)
                    
                    .padding(.top, 2)
                
                Divider().background(Color.theme.ctGreen)
            }
            .padding(.top)
            .padding(.horizontal)

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
                .padding(.top, 5)
                    .padding(.bottom, 5)
                    .background(isExpanded ? Color.theme.ctGray : Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal)
                
            }
            .padding(.top)
        }
        .padding(.top)
    }
}

struct PhysicalResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalResourcesView()
    }
}

extension PhysicalResourcesView{
    private var accordation: some View {
//        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(isExpanded ? "drop-up" : "drop-down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                }
                .padding(.horizontal, 5)
                .padding(.top, -8)
                
                VStack(alignment: .leading) {
                    Text("Vehicle Info")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, -5)
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(accordionDetails) { item in
                                Text(item.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {

                            ForEach(accordionDetails) { item in
                                Text(item.detail)
                                    .foregroundColor(Color.theme.smtFont)
                                    .font(.footnote)
                                    .fontWeight(.regular)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                }
            }
            .padding(.top, 12)
            .padding(.bottom)
//        }
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
                Text("Vehicle Info")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            
        }
    }
}
