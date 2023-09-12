//
//  Service.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

class Service {
    
    private enum ServiceError: Int, Error {
        case missingData = 1001
        
        var localizedDescription: String {
            switch self {
            case .missingData:
                return "Data is missing"
            }
        }
    }
    
    private struct Endpoints {
        static let highSchools = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        static let satScores = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
    
    func fetchHighSchools(completion: @escaping (Result<[HighSchool], Error>) -> Void) {
        let url = URL(string: Endpoints.highSchools)!
        fetchData(from: url, completion: completion)
    }

    func fetchSATScores(completion: @escaping (Result<[SATScore], Error>) -> Void) {
        let url = URL(string: Endpoints.satScores)!
        fetchData(from: url, completion: completion)
    }

    private func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(ServiceError.missingData))
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
