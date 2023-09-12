//
//  DataSession.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

class DataSession {
    
    var highSchools: [HighSchool] = []
    var satScores: [SATScore] = []
    
    func fetchHighSchools(completion: @escaping ([HighSchool]?, Error?) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let schools = try JSONDecoder().decode([HighSchool].self, from: data)
                    completion(schools, nil)
                } catch let error {
                    completion(nil, error)
                }
            } else if let error = error {
                completion(nil, error)
            }
        }.resume()
    }

    
    func fetchSATScores(completion: @escaping ([SATScore]) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let scores = try? JSONDecoder().decode([SATScore].self, from: data)
                completion(scores ?? [])
            }
        }.resume()
    }
}
