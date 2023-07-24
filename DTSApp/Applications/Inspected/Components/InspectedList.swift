//
//  InspectedList.swift
//  DTSApp
//
//  Created by Macbook on 02/06/2023.
//

import SwiftUI

struct InspectedList: View {
    @State private var isExpanded: Bool = false
    let inspectedListDetails = InspectedListViewModel.DatailsData
    @State private var showMenu = false
    let inspedted: InspectedModel?
    
    var body: some View {
        
            
            ScrollView{
                VStack {
                    if isExpanded {
                        accordionDetails
                    }else {
                        accordionTitle
                    }
                }

            }
            .navigationBarHidden(true)
    }
}

//struct InspectedList_Previews: PreviewProvider {
//    static var previews: some View {
//        InspectedList()
//    }
//}

extension InspectedList {
    
    private var accordionTitle : some View {
        HStack {
            Button(action: {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }, label: {
                Image(isExpanded ? "drop-up" : "drop-down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 27)
                HStack {
                    Text("Assign Date:")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(inspedted?.assignedDate ?? "")
                        .font(.headline)
                        .fontWeight(.regular)
                }
            })
            .foregroundColor(.black)
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.ctGray)
        .cornerRadius(5)
    }
    
    private var accordionDetails: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    withAnimation(.easeInOut){
                        isExpanded.toggle()
                    }
                    
                }, label: {
                    Image(isExpanded ? "drop-up" : "drop-down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 27, height: 27)
                    HStack {
                        Text("Assign Date:")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.semibold)
                        Text(inspedted?.assignedDate ?? "")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.semibold)
                    }
                })
                .foregroundColor(.black)
            }
            
                InspectedListData(title: "Bussiness name" , detail: inspedted?.businessName ?? "")
                InspectedListData(title: "Bussiness Type" , detail: inspedted?.businessType ?? "")
                InspectedListData(title: "Inspection end date" , detail: inspedted?.inspectionEndDate ?? "")
                InspectedListData(title: "Remarks" , detail: inspedted?.remarks ?? "")
                            
            Button(action: {}, label: {
                Text("View Details")
                    .foregroundColor(.white)
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
            })
            .frame(width: UIScreen.main.bounds.width * 0.5, height: 34, alignment: .center)
            .background(Color.theme.ctGreen)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 3)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.ctGray)
        .cornerRadius(5)
    }
}
