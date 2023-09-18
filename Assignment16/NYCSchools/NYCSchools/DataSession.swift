//
//  DataSession.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

// A class to manage the data sessions for fetching school-related data.
class DataSession: DataFetching {

    // An array to hold the fetched High School data
    var schools = [HighSchool]()

    // An array to hold the fetched SAT scores data
    var satScores = [SATScore]()

    // An inner enum to define specific errors that might be encountered in the data session
    private enum DataSessionError: Error {
        case invalidURL
        case noDataReceived
    }

    // Endpoints for fetching data
    let highSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satScoresURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

    // Asynchronous function to fetch data from the given URL
    func fetchData(from urlString: String) async {
        // Check and create a valid URL from the highSchoolsURL
        guard let _url = URL(string: highSchoolsURL) else { return }

        do {
            // Use the network manager to fetch and decode the high school data
            self.schools = try await NetworkManager.requstURL(url: _url, responseType: highSchools.self)
            print(self.schools)
        } catch {
            // If an error occurs, print the error description
            print(error.localizedDescription)
        }
    }

    // Asynchronous function to fetch high school data
    func fetchHighSchoolData(url: String) async {
        // Check and create a valid URL from the satScoresURL
        guard let _url = URL(string: satScoresURL) else { return }

        do {
            // Use the network manager to fetch and decode the SAT scores data
            self.satScores = try await NetworkManager.requstURL(url: _url, responseType: [SATScore].self)
        } catch {
            // If an error occurs, print the error description
            print(error.localizedDescription)
        }
    }

    // Fetches SAT score of a specific school using its dbn
    func getOneSchoolSat(dbn: String) -> SATScore? {
        // Returns the first SAT score where the dbn matches
        return self.satScores.first(where: { ($0.dbn ?? " ") == dbn })
    }

}

// Type aliases to make the code more readable
typealias highSchools = [HighSchool]
typealias satScores = [SATScore]

// A utility class to manage the network requests
class NetworkManager {
    
    // A generic asynchronous function to request and decode data from a given URL.
    static func requstURL<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        // Use the shared URL session instance
        let session = URLSession.shared
        
        // Create a URL request for the given URL
        let request = URLRequest(url: url)
        
        // Asynchronously fetch data for the given request
        let (data, _) = try await session.data(for: request)

        // Initialize a JSON decoder
        let jsonDecoder = JSONDecoder()

        // Decode the received data into the expected response type
        let result = try jsonDecoder.decode(ResponseType.self, from: data)

        return result
    }
}
