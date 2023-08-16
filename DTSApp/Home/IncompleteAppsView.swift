//
//  IncompleteAppsView.swift
//  DTSApp
//
//  Created by Apple on 01/07/2023.
//

import SwiftUI
import Charts

struct IncompleteAppsView: View {
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
                Text("Incomplete Applications Summury")
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
            
            VStack{
                VStack {
//                    GeometryReader { reader in
                        Chart(entries: [
                            //x - position of a bar, y - height of a bar
                            BarChartDataEntry(x: 1, y: Double(homeInfo?.inCompleted ?? 0)),
                            BarChartDataEntry(x: 2, y: Double(homeInfo?.lateApplications ?? 0)),
                            BarChartDataEntry(x: 3, y: Double(homeInfo?.nextWeekComplete ?? 0)),
                        ])
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
//                    }
                }
//                .frame(height: 300.0)

                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.recieved)
                            .frame(width: 20, height: 20)
                        Text("In Progress: \(homeInfo?.inCompleted ?? 0)")
                            .foregroundColor(.primary)

                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.inspected)
                            .frame(width: 20, height: 20)
                        Text("This week: \(homeInfo?.nextWeekComplete ?? 0)")
                            .foregroundColor(.primary)

                    }
                    Divider()
                    HStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(UIColor.theme.inProgress)
                            .frame(width: 20, height: 20)
                        Text("Over Due Date: \(homeInfo?.lateApplications ?? 0)")
                            .foregroundColor(.primary)

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

struct IncompleteAppsView_Previews: PreviewProvider {
    static var previews: some View {
        IncompleteAppsView()
    }
}
