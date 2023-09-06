//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import Foundation

class NetworkManager {
    
    func getCountries(completionHandler: @escaping ([Country]?, Error?) -> Void) { //fetch countries from an API.
        guard let url = URL(string: "https://gist.github.com/.../countries.json") else { //Makes sure the URL is valid; if not, returns out of function.
            return
        }
        
        let request = URLRequest(url: url) //Creates a URL request object.
        let urlSession = URLSession.shared //Creates a task to fetch data.
        let sessionTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let error = error { //Checks if any error occurred during the data fetching, and passes it to the completionHandler.
                completionHandler(nil, error)
                return
            }
            
            guard let data = data else { //Makes sure that data exists
                completionHandler(nil, NSError(domain: "DataNilError", code: -10001, userInfo: nil))
                return
            }
            
            let jsonDecoder = JSONDecoder() //Initializes a JSON decoder.
            
            do { //Tries to decode the data into an array of Country objects and passes it or the error to the completionHandler.
                let countries = try jsonDecoder.decode([Country].self, from: data)
                completionHandler(countries, nil)
            } catch let decodeError {
                completionHandler(nil, decodeError)
            }
        }
        
        sessionTask.resume()
    }
}
