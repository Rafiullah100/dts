//
//  InspectedAppsView.swift
//  DTSApp
//
//  Created by Apple on 26/06/2023.
//

import SwiftUI

struct InspectedAppsView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject var inspectedAppNetworkModel = InspectedNetworkViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("home-back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                
                Spacer()
                Text("Inspected Applications - District Wise")
                Spacer()
                Image("notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 28)
            }
            .padding()
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(inspectedAppNetworkModel.inspectedAppModel ?? [], id: \.self) { item in
                        Text(item.district)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal)
                            .padding(.top)
                        HStack {
                            ProgressView(value: 0.5)
                                .accentColor(Color.theme.ctGreen)
                                .scaleEffect( y: 7.5, anchor: .center)
                                .frame(width: UIScreen.main.bounds.width - 120, height: 15)
                            Spacer()
                            Text("\(item.number)")
                                .foregroundColor(Color.theme.ctGreen)
                            Text("(\(item.percentage)%)")
                                .foregroundColor(Color.theme.ctGreen)
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    
                }
                .padding(.top)
                .onAppear {
                    inspectedAppNetworkModel.fetch()
                }
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct InspectedAppsView_Previews: PreviewProvider {
    static var previews: some View {
        InspectedAppsView()
    }
}
