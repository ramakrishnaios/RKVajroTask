//
//  APIHandler.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 30/06/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import Foundation
class APIHandler{
    static let baseURL = "https://dev-api.vajro.com/"
    static let shared = APIHandler()
    public func getAPI<T:Codable>(url:String,returnType:T.Type,completion: @escaping(Result<T, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: URL.init(string: APIHandler.baseURL + url)!) { (data, response, error) in
            guard let data = data, error == nil else{
               return
            }
            var decoadableResult : T?
            do{
                decoadableResult = try JSONDecoder().decode(T.self, from: data)
            }
            catch{
               print(error)
                completion(.failure(error))
            }
            guard let result = decoadableResult else{
                return
            }
            completion(.success(result))
        }
        task.resume()
        
    }
    
    
}
