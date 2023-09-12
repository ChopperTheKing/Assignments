//
//  Service.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

// Service.swift
class Service {
    func fetchHighSchools(completion: @escaping (Result<[HighSchool], Error>) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        fetchData(from: url, completion: completion)
    }

    func fetchSATScores(completion: @escaping (Result<[SATScore], Error>) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        fetchData(from: url, completion: completion)
    }

    private func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data is missing"])))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
