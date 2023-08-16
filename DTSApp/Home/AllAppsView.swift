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
    @State var homeInfo: HomeModel?
    
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
                    .foregroundColor(.primary)

                Spacer()
                NavigationLink(destination: NotificationView()) {
                    Image("notification")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25.0, height: 25.0)
                }
            }
            .padding()
            
            VStack {
                VStack {
//                    GeometryReader { reader in
                        Chart(entries: [
                            //x - position of a bar, y - height of a bar
                            BarChartDataEntry(x: 1, yValues: [Double(homeInfo?.totalInspectionAssinged ?? 0)], data: "Total Received"),
                               BarChartDataEntry(x: 2, yValues: [Double(homeInfo?.completed ?? 0)], data: "Total Inspected"),
                            BarChartDataEntry(x: 3, yValues: [Double(homeInfo?.inCompleted ?? 0)], data: "In Progress"),
                            BarChartDataEntry(x: 4, yValues: [Double(homeInfo?.nextWeekComplete ?? 0)], data: "This week"),
                            BarChartDataEntry(x: 5, yValues: [Double(homeInfo?.lateApplications ?? 0)], data: "Over Due Date"),
                        ])
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
//                    }
                }
//                .frame(height: 300.0)

                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.recieved)
                            .frame(width: 20, height: 20)
                        Text("Total Received: \(homeInfo?.totalInspectionAssinged ?? 0)")
                            .foregroundColor(.primary)

                        
                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.inspected)
                            .frame(width: 20, height: 20)
                        Text("Total Inspected: \(homeInfo?.completed ?? 0)")
                            .foregroundColor(.primary)
                            .font(.custom("Poppins-Medium", size: 18))
                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.inProgress)
                            .frame(width: 20, height: 20)
                        Text("In Progress: \(homeInfo?.inCompleted ?? 0)")
                            .foregroundColor(.primary)
                            .font(.custom("Poppins-Medium", size: 18))
                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.week)
                            .frame(width: 20, height: 20)
                        Text("This week: \(homeInfo?.nextWeekComplete ?? 0)")
                            .foregroundColor(.primary)
                            .font(.custom("Poppins-Medium", size: 18))
                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.overDue)
                            .frame(width: 20, height: 20)
                        Text("Over Due Date: \(homeInfo?.lateApplications ?? 0)")
                            .foregroundColor(.primary)
                            .font(.custom("Poppins-Medium", size: 18))
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.5)
                .onAppear{}
            }
            .padding()
//            .padding(.top, -200)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        AllAppsView()
    }
}


