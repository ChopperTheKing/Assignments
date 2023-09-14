//
//  Service.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

// This class provides services to fetch high school and SAT scores data.
class Service {
    
    // Private enum that defines custom errors for the Service class.
    private enum ServiceError: Int, Error {
        case missingData = 1001
        
        // Provides a human-readable description for each error.
        var localizedDescription: String {
            switch self {
            case .missingData:
                return "Data is missing"
            }
        }
    }
    
    // Struct to hold the endpoints URLs for fetching high school and SAT scores data.
    private struct Endpoints {
        static let highSchools = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        static let satScores = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
    
    // Fetches the high school data and provides the result through a completion handler.
    func fetchHighSchools(completion: @escaping (Result<[HighSchool], Error>) -> Void) {
        let url = URL(string: Endpoints.highSchools)!
        fetchData(from: url, completion: completion)
    }

    // Fetches the SAT scores data and provides the result through a completion handler.
    func fetchSATScores(completion: @escaping (Result<[SATScore], Error>) -> Void) {
        let url = URL(string: Endpoints.satScores)!
        fetchData(from: url, completion: completion)
    }

    // Private generic method to fetch data from the provided URL and decode it into the specified type.
    // This method is designed to be reused for different types of fetch operations.
    private func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            // Switching to the main thread to ensure UI operations (like updating the UI with fetched data) are smooth.
            DispatchQueue.main.async {
                // Check if there's an error from the URLSession, if so return the error.
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                // Make sure data exists, else return a custom missing data error.
                guard let data = data else {
                    completion(.failure(ServiceError.missingData))
                    return
                }
                
                // Try to decode the fetched data, and complete with the result (either success or failure).
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()  // Start the data task.
    }
}
