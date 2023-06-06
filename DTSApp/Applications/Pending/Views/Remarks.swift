//
//  Remarks.swift
//  DTSApp
//
//  Created by Macbook on 22/05/2023.
//

import SwiftUI

struct Remarks: View {
    @State var showMenu: Bool
    @State private var selectedFilter: detailFormtab = .remarks
    
    var body: some View {
        ZStack(alignment: .top){
            ReportsMenuBar(MenuBarTile: "Detail", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            
            VStack {
                filterView(selectedFilter: $selectedFilter)
                
                switch selectedFilter {
                case .remarks :
                    RemarksDetails()
                case .basicInfo:
                    BasicInfoView()
                case .contactInfo:
                    ContactInfoView()
                case .legalInfo:
                    LegalInfoView()
                }
                Spacer()
            }
            .padding(.top, 50)
            .navigationBarHidden(true)
        }
        
    }
}

struct Remarks_Previews: PreviewProvider {
    static var previews: some View {
        Remarks(showMenu: false)
    }
}

struct filterView: View {
    @Binding var selectedFilter: detailFormtab // Binding to keep the selected filter in sync with ContentView
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(detailFormtab.allCases, id: \.rawValue) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.custom("Poppins", size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(selectedFilter == item ? .black : Color.theme.lgtFont)
                        
                        if selectedFilter == item {
                            Circle()
                                .foregroundColor(Color.theme.ctGreen)
                                .frame(height: 4.5)
                        } else {
                            Circle()
                                .foregroundColor(Color.clear)
                                .frame(height: 4.5)
                        }
                    }
                    .padding(.horizontal)
                    .fixedSize()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedFilter = item
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
}



struct RemarksDetails: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                Text("Visit Date")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                
                DatePicker(selection: .constant(Date()), displayedComponents: .date, label: {
                    Image("date")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    Image("calendar-light")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                })
            }
            .padding()
            //
            //
            VStack(alignment: .leading){
                Text("Visit time")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                
                HStack {
                    
                    Image("time")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    Image("watch")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    DatePicker("", selection: .constant(Date()), displayedComponents: .hourAndMinute)
                        
                        .font(.custom("Poppins", size: 12))
                        .foregroundColor(.black)
                        .background(Color.clear)
                    
                }
                
            }
            .padding()
            //
            //
            VStack(alignment: .leading){
                Text("Application Remarks")
                    .font(.custom("Poppins", size: 12))
                    .fontWeight(.semibold)
                
                HStack {
                    TextField("For Inspection only. For Inspection only. ", text: $textFieldText)
                        .font(.custom("Poppins", size: 10))
                        .padding()
                }
                .frame(height : 124, alignment: .top)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.2), radius: 3)
            }
            .padding()
            
            
            VStack{
                HStack{
                    Button(action: {}, label: {
                        Text("Send Email")
                            .font(.custom("Poppins", size: 12))
                            .fontWeight(.semibold)
                    })
                    .frame(width: 95, height: 34)
                    .foregroundColor(.white)
                    .background(Color.theme.ctGreen)
                    
                    .cornerRadius(3)
                    
                    
                    Button(action: {}, label: {
                        Text("Send Email")
                            .font(.custom("Poppins", size: 12))
                            .fontWeight(.semibold)
                    })
                    .frame(width: 107, height: 34)
                    .foregroundColor(.white)
                    .background(Color.theme.ctLightBlue)
                    .cornerRadius(3)
                }
            }
        }
    }
}
