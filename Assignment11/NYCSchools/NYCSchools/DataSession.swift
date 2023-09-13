//
//  DataSession.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import Foundation

class DataSession {
    var schools = [HighSchool]()
    var satScores = [SATScore]()
    private enum DataSessionError: Error {
        case invalidURL
        case noDataReceived
    }
    
     let highSchoolsURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satScoresURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    func fetchData(from urlString: String) async {
        guard let _url = URL(string: highSchoolsURL) else{ return }
      
            do{
                self.schools = try await NetworkManager.requstURL (url: _url, responseType: highSchools.self)
                print(self.schools)
            }catch {
                print(error.localizedDescription)
            }
    }
    
    func fetchHighSchoolData(url:String)  async{
        guard let _url = URL(string: satScoresURL) else{ return }
      
            do{
                self.satScores = try await NetworkManager.requstURL (url: _url, responseType: [SATScore].self)
            }catch {
                print(error.localizedDescription)
            }
    }
    
    func getOneSchoolSat(dbn:String)->SATScore?{
        return self.satScores.first(where: { ($0.dbn ?? " ") == dbn  })
    }

}

typealias highSchools = [HighSchool]
typealias satScores  = [SATScore]
class NetworkManager{
    static func requstURL<ResponseType:Decodable>(url: URL,responseType:ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url:url)
        let (data,response) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
}
