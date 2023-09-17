//
//  Protocols.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/16/23.
//

import Foundation

// Protocol defining methods required for fetching data
protocol DataFetching {
    func fetchData(from urlString: String) async
    func fetchHighSchoolData(url: String) async
    func fetchHighSchools() async throws -> [HighSchool]  // Added this method
    func getOneSchoolSat(dbn: String) -> SATScore?
}

// Protocol defining methods required for making network requests
protocol NetworkManaging {
    func requestURL<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType
}

