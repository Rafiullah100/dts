//
//  InspectedData.swift
//  DTSApp
//
//  Created by Macbook on 18/07/2023.
//

import SwiftUI

struct InspectedData: View {
    @State private var showMenu = false
    @State private var InspedtedListModel: [InspectedModel]?


    var body: some View {
        
        ZStack(alignment: .top){
            ReportsMenuBar(MenuBarTile: "Inspected List", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            
            ScrollView {
                LazyVStack(alignment: .leading){
                    ForEach(InspedtedListModel ?? [], id: \.id) { item in
                            InspectedList(inspedted: item)
                        }
                    }
                .padding(.horizontal)
                    
                .onAppear {
                    URLSession.shared.request(route: .inspectedList, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: [InspectedModel].self) { result in
                        
                        switch result {
                        case .success(let inspectedModels):
                            DispatchQueue.main.async {
                                self.InspedtedListModel = inspectedModels
                                print(self.InspedtedListModel)
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
            }
            }
            .padding(.top, 60)

        }
    }
}

struct InspectedData_Previews: PreviewProvider {
    static var previews: some View {
        InspectedData()
    }
}
