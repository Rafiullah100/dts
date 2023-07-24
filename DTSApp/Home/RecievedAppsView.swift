//
//  RecievedAppsView.swift
//  DTSApp
//
//  Created by Apple on 26/06/2023.
//

import SwiftUI

struct RecievedAppsView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("home-back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 15, alignment: .center)
                })
                
                Spacer()
                Text("All Received Applications - District Wise")
                Spacer()
                Image("notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 28)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Peshwar")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.horizontal)
                HStack {
                    ProgressView(value: 0.5)
                        .accentColor(Color.theme.ctGreen)
                        .scaleEffect( y: 7.5, anchor: .center)
                    Spacer()
                    Text("27 (65 %)")
                        .foregroundColor(Color.theme.ctGreen)
                }
                .padding(.horizontal)
                
                
            }
            .padding(.top)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct RecievedAppsView_Previews: PreviewProvider {
    static var previews: some View {
        RecievedAppsView()
    }
}
