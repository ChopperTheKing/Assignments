//
//  Service.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

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
    
    // Network manager property to be injected
    var networkManager: NetworkManaging

    // Initialization with dependency injection
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }

    // Fetches the high school data
    func fetchHighSchools() async throws -> [HighSchool] {
        let url = URL(string: Endpoints.highSchools)!
        return try await networkManager.requestURL(url: url, responseType: [HighSchool].self)
    }

    // Fetches the SAT scores data
    func fetchSATScores() async throws -> [SATScore] {
        let url = URL(string: Endpoints.satScores)!
        return try await networkManager.requestURL(url: url, responseType: [SATScore].self)
    }
}

