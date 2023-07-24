//
//  NetworkService.swift
//  Api Task
//
//  Created by Apple  on 11/01/2023.
//

import Foundation
import UIKit
import SwiftUI

extension URLSession{
    
    func request<T: Codable>(route: Route, method: Method, parameters: [String: Any]? = nil, model: T.Type, completion: @escaping (Result<T, AppError>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        let task = dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error{
                    print(error)
                    completion(.failure(.unknownError))
                }
                else{
                    completion(.failure(AppError.unknownError))
                }
                return
            }
            
            let str = String(data: data, encoding: .utf8) ?? ""
            print("Data str is: \(str)")
            
            do {
                let result = try JSONDecoder().decode(model, from: data)
//                print(result)
                completion(.success(result))
            } catch let error {
                print(error)
                completion(.failure(AppError.errorDecoding))
            }
        }
        task.resume()
    }
    
    func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }

}
