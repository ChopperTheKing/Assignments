//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import Foundation

class NetworkManager {
    
    // Fetch countries from an API
    func getCountries(completionHandler: @escaping ([Country]?, Error?) -> Void) {
        
        // Ensure the URL is valid; if not, exit the function
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            return
        }
        
        // Create a URL request object
        let request = URLRequest(url: url)
        
        // Create a task to fetch data
        let urlSession = URLSession.shared
        let sessionTask = urlSession.dataTask(with: request) { data, response, error in
            
            // Check for errors during data fetching and pass it to the completionHandler
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            // Ensure that data exists
            guard let data = data else {
                completionHandler(nil, NSError(domain: "DataNilError", code: -10001, userInfo: nil))
                return
            }
            
            // Initialize a JSON decoder
            let jsonDecoder = JSONDecoder()
            
            // Try to decode the data into an array of Country objects
            do {
                let countries = try jsonDecoder.decode([Country].self, from: data)
                completionHandler(countries, nil)
            } catch let decodeError {
                completionHandler(nil, decodeError)
            }
        }
        
        // Start the task
        sessionTask.resume()
    }
}
