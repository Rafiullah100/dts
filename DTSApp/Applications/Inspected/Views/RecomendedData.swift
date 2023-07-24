//
//  RecomendedData.swift
//  DTSApp
//
//  Created by MacBook Pro on 7/19/23.
//

import SwiftUI

struct RecomendedData: View {
    @State private var showMenu = false
    @State private var recommendedListModel: [RecommendedModel]?
    
    
    var body: some View {
        ZStack{
            
            
            ReportsMenuBar(MenuBarTile: "Recommended List", showMenu: $showMenu)
                .zIndex(showMenu ? 2 : 0)
            
            
            ScrollView{
                LazyVStack{
                    
                    ForEach(recommendedListModel ?? [], id: \.self) { item in
                        RecommendedList(recommended: item)
                    }
                }
                .padding(.horizontal)

                .onAppear {
                    URLSession.shared.request(route: .recommendedList, method: .get, parameters: ["Uid": UserDefaults.standard.departmentID ?? 0], model: [RecommendedModel].self) { result in
                        
                        switch result {
                        case .success(let recommendedModels):
                            DispatchQueue.main.async {
                                self.recommendedListModel = recommendedModels
                                
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
            .padding(.top, 50)

        }
    }
}

struct RecomendedData_Previews: PreviewProvider {
    static var previews: some View {
        RecomendedData()
    }
}
