//
//  InspectedNetwork.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation

class InspectedNetworkViewModel: ObservableObject {
    @Published var inspectedAppModel: [InspectedAppsModel]?
    
    func fetch() {
        guard let url = URL(string: "http://175.107.63.137/api/Apis/GetInspectorCompleteChart?Uid=39") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode([InspectedAppsModel].self, from: data)
                DispatchQueue.main.async {
                    self?.inspectedAppModel = response
                    print("THE RESPONSE", response)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
