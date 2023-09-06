//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import Foundation

class NetworkManager {
    
    func getCountries(completionHandler: @escaping ([Country]?, Error?) -> Void) {
        guard let url = URL(string: "https://gist.github.com/.../countries.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let sessionTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            guard let data = data else {
                completionHandler(nil, NSError(domain: "DataNilError", code: -10001, userInfo: nil))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let countries = try jsonDecoder.decode([Country].self, from: data)
                completionHandler(countries, nil)
            } catch let decodeError {
                completionHandler(nil, decodeError)
            }
        }
        
        sessionTask.resume()
    }
}
