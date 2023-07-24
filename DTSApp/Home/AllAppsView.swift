//
//  Chart.swift
//  DTSApp
//
//  Created by Apple on 01/07/2023.
//

import Charts
import SwiftUI

struct AllAppsView: View {
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
                Text("All Applications Summury")
                Spacer()
                Image("notification")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 28)
            }
            .padding()
            
            VStack {
                Chart(entries: [
                    //x - position of a bar, y - height of a bar
                    BarChartDataEntry(x: 1, y: 5),
                    BarChartDataEntry(x: 1, y: 3),
                    BarChartDataEntry(x: 1, y: 2),
                    BarChartDataEntry(x: 1, y: 3),
                    BarChartDataEntry(x: 1, y: 3),
                    BarChartDataEntry(x: 1, y: 3),
                ])
                
            }
//            .padding(.top, -200)
        }
        .navigationBarHidden(true)
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        AllAppsView()
    }
}


