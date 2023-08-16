//
//  NotificationView.swift
//  DTSApp
//
//  Created by MacBook Pro on 7/26/23.
//

import SwiftUI

struct NotificationView: View {
    @State var showMenu = false
    @State private var notification: [NotificationModel]?
    @State var showLoader = true
    
    var body: some View {
        ZStack {
            ReportsMenuBar(MenuBarTile: "Notifications", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: -10){
                    ForEach(notification ?? [], id: \.self) { item in
                        NotificationCardView(notification: item)
                    }
                }
            }
            .padding(.top, 60)
            .onAppear{
                URLSession.shared.request(route: .notification, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: [NotificationModel].self) { result in
                    self.showLoader = false
                    switch result {
                    case .success(let notification):
                        DispatchQueue.main.async {
                            self.notification = notification
                            print(self.notification ?? [])
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        HStack {
            if showLoader{
                ProgressView()
                    .frame(width:100, height: 100)
                    .foregroundColor(Color(.red))
            }
        }
    }
}

struct NotificationCardView: View {
    let notification: NotificationModel?
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Text("Assigned By: ")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(notification?.fullName ?? "")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fontWeight(.light)
            }
            HStack(alignment: .top) {
                Text("Assigned Remarks: ")
                    .font(.subheadline)
                    .foregroundColor(.primary)

                Text(notification?.remarks ?? "")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fontWeight(.light)
            }
            HStack(alignment: .top) {
                Text("Assigned Date: ")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(notification?.inspectionEndDate ?? "")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fontWeight(.light)
            }
            
            HStack(alignment: .top) {
                Spacer()
                Text("\(notification?.assignedMins ?? 0) mins ago")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fontWeight(.light)
            }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 10)
        .background(UIColor.theme.cardBGView)
        .cornerRadius(5)
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
