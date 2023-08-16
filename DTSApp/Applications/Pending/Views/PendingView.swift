//
//  PendingView.swift
//  DTSApp
//
//  Created by Macbook on 12/05/2023.
//

import SwiftUI

struct PendingView: View {
    @State var searchText = ""
    @State var title = ""
    @State var showMenu = false
    @State var showLoader = true

    @State private var pendingApplication: [PendingApplicationsModel]?

    
    var body: some View {
            ZStack(alignment: .top){
                
                ReportsMenuBar(MenuBarTile: "Pending Application", showMenu: $showMenu)
                    .zIndex(showMenu ? 2 : 0)
                
                ScrollView {
                    VStack {
                        HStack{
                            Image("search-icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 21, height: 21)
                                .padding(8)
                            
                            TextField(title, text: $searchText)
                                .font(.system(size: 13, weight: .light))
                                .padding(5)
                        }
                        .background(UIColor.theme.ctGray)
                        .cornerRadius(5)

                        .padding()
                        
                        ForEach(pendingApplication ?? [], id: \.recordID) { application in
                            AccordionDetails(showMenu: showMenu, pendingApplication: application)
                        }
                    }
                    .onAppear {
                        URLSession.shared.request(route: .pendingApplications, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: [PendingApplicationsModel].self) { result in
                            self.showLoader = false
                            switch result {
                            case .success(let pendingApplications):
                                DispatchQueue.main.async {
                                    self.pendingApplication = pendingApplications
                                    print(self.pendingApplication ?? [])
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                }
                .padding(.top, 50)
                
                HStack {
                    if showLoader{
                        ProgressView()
                            .frame(width:100, height: 100)
                            .foregroundColor(Color(.red))
                    }
                }
            }
    }
}

struct PendingView_Previews: PreviewProvider {
    static var previews: some View {
        PendingView()
    }
}
