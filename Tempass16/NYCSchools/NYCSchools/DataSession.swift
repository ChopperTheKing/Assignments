//
//  DataSession.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

class DataSession: DataFetching {
    func fetchHighSchools() async throws -> [HighSchool] {
        // We'll use the DataFetching protocol's fetchData method with the appropriate URL
        await fetchData(from: Endpoints.highSchoolsURL)
        return schools

    }

    
    
    // An array to hold the fetched High School data
    var schools = [HighSchool]()
    // An array to hold the fetched SAT scores data
    var satScores = [SATScore]()
    // Network manager property to be injected
    var networkManager: NetworkManaging

    // Endpoints for fetching data
    let highSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satScoresURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

    // Initialization with dependency injection
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }

    func fetchData(from urlString: String) async {
        guard let _url = URL(string: highSchoolsURL) else { return }
        do {
            self.schools = try await networkManager.requestURL(url: _url, responseType: [HighSchool].self)
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchHighSchoolData(url: String) async {
        guard let _url = URL(string: satScoresURL) else { return }
        do {
            self.satScores = try await networkManager.requestURL(url: _url, responseType: [SATScore].self)
        } catch {
            print(error.localizedDescription)
        }
    }

    func getOneSchoolSat(dbn: String) -> SATScore? {
        return self.satScores.first(where: { ($0.dbn ?? " ") == dbn })
    }
}

class NetworkManager: NetworkManaging {
    
    func requestURL<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
}

