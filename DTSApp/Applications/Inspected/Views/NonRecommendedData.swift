//
//  NonRecommendedData.swift
//  DTSApp
//
//  Created by MacBook Pro on 7/24/23.
//

import SwiftUI

struct NotRecommendedData: View {
    @State private var showMenu = false
    @State private var notRecommendedListModel: [NotRecommendedModel]?
    
    var body: some View {
        ZStack{
            ReportsMenuBar(MenuBarTile: "Not Recommended List", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            ScrollView{
                LazyVStack{
                    ForEach(notRecommendedListModel ?? [], id: \.id) { item in
                        NotRecommendedList(notRecommended: item)
                    }
                }
                .padding(.horizontal)
                .onAppear {
                    URLSession.shared.request(route: .notRecommendedList, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: [NotRecommendedModel].self) { result in
                        switch result {
                        case .success(let notRecommendedModels):
                            DispatchQueue.main.async {
                                self.notRecommendedListModel = notRecommendedModels
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

struct NotRecommendedData_Previews: PreviewProvider {
    static var previews: some View {
        NotRecommendedData()
    }
}
