//
//  DataSession.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

class DataSession {
    
    private enum DataSessionError: Error {
        case invalidURL
        case noDataReceived
    }
    
    private let highSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private let satScoresURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    private func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(DataSessionError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(DataSessionError.noDataReceived))
                    return
                }
                
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
    
    func fetchHighSchoolData(completion: @escaping (Result<[(name: String, score: SATScore?)], Error>) -> Void) {
        fetchHighSchools { schoolsResult in
            switch schoolsResult {
            case .success(let schools):
                self.fetchSATScores { scoresResult in
                    switch scoresResult {
                    case .success(let scores):
                        let combinedData = schools.map { school -> (name: String, score: SATScore?) in
                            let matchingScore = scores.first(where: { $0.dbn == school.dbn })
                            return (school.school_name, matchingScore)
                        }
                        completion(.success(combinedData))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchHighSchools(completion: @escaping (Result<[HighSchool], Error>) -> Void) {
        fetchData(from: highSchoolsURL, completion: completion)
    }
    
    private func fetchSATScores(completion: @escaping (Result<[SATScore], Error>) -> Void) {
        fetchData(from: satScoresURL, completion: completion)
    }
}
