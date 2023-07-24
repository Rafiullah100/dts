//
//  InspectedNetwork.swift
//  DTSApp
//
//  Created by Macbook on 06/07/2023.
//

import Foundation

class BasicNetworkModel: ObservableObject {
    @Published var basicInfoModel: BasicInfoModel?
    
    func fetch() {
        guard let url = URL(string: "http://175.107.63.137/api/Apis/GetBasicInspectionDetails?Uid=39&basicInfoID=Business75") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(BasicInfoModel.self, from: data)
                DispatchQueue.main.async {
                    self?.basicInfoModel = response
                    print("THE New RESPONSE", response)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
