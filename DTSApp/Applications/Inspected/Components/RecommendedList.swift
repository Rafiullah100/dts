//
//  RecommendedList.swift
//  DTSApp
//
//  Created by Macbook on 19/06/2023.
//

import SwiftUI

struct RecommendedList: View {
    let RecommendedListDetails = RecommendedListViewModel.DatailsData
    @State private var isExpanded: Bool = false
    
    let recommended: RecommendedModel?


    
    var body: some View {
        ZStack(alignment: .top){
            
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
}

//struct RecommendedList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendedList()
//    }
//}

extension RecommendedList {
    
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
                    
                    Text(recommended?.onDate ?? "")
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
                        Text("Assign Date: ")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.semibold)
                        Text(recommended?.onDate ?? "")
                            .font(.custom("Poppins", size: 14))
                            .fontWeight(.semibold)
                    }
                })
                .foregroundColor(.black)
                
            }
            
            InspectedListData(title: "Bussiness name" , detail: recommended?.businessName ?? "")
            InspectedListData(title: "Bussiness type" , detail: recommended?.businessType ?? "")
            InspectedListData(title: "Date" , detail: recommended?.onDate ?? "")
            InspectedListData(title: "Remarks" , detail: recommended?.remarks ?? "")
            
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
