//
//  NetworkService.swift
//  Countries
//
//  Created by Ronnie Kissos on 9/5/23.
//

import Foundation

//protocol NetworkService {
//    func getCountries(completionHandler: @escaping (Result<[Country], Error>) -> Void)
//}

func getCountries(completionHandler: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else {
            completionHandler(.failure(NetworkError.invalidURL)) //If the URL is invalid, we immediately call the completionHandler with a .failure case, passing in our custom NetworkError.invalidURL error.
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error { // Check for errors first
                completionHandler(.failure(error))
                return
            }

            
            guard let data = data else { // Check if data exists
                completionHandler(.failure(NetworkError.noData))
                return
            }

            
            do { // Try decoding the data
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completionHandler(.success(countries))
            } catch let jsonError {
                completionHandler(.failure(jsonError))
            }
        }.resume()
    }

enum NetworkError: Error {
    case invalidURL
    case noData
}
