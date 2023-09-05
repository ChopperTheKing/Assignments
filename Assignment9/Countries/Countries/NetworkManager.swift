//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import Foundation

class NetworkManager: NetworkService {
    weak var delegate: NetworkManagerDelegate?
    
    func getCountries(completionHandler: @escaping ([Country]?, Error?) -> Void) {
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            completionHandler(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let sessionTask = urlSession.dataTask(with: request) { data, response, error in
           
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }

            let jsonDecoder = JSONDecoder()
            do {
                   let countries = try jsonDecoder.decode([Country].self, from: data)
                   self.delegate?.didFetchCountries(countries)
               } catch {
                   self.delegate?.didFailWithError(error)
               }
        }
        sessionTask.resume()
    }
}
