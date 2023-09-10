//
//  NewsViewModel.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import Foundation

// this class defines the view model for fetching and managing news articles in the app.
// tt handles fetching the news from a local JSON file and processing the fetched data.
class NewsViewModel {
    
    // a list of articles that are fetched. The `private(set)` access control
    // ensures that external classes can only read the value but cannot modify it.
    private(set) var articles: [Article]?
    
    // fetches the news and notifies the caller when the fetching is completed
    // by either successfully fetching the news or failing with an error.
    func fetchNews(completion: @escaping (Result<News, Error>) -> Void) {
        parseJSON { news in
            if let news = news {
                self.articles = news.articles
                completion(.success(news))
            } else {
                // Notifying the caller that there was an error parsing the JSON.
                completion(.failure(NSError(domain: "NewsViewModel", code: 100, userInfo: [NSLocalizedDescriptionKey: "Error parsing JSON"])))
            }
        }
    }
    
    // private method to parse the JSON data from a local file named "News.json".
    // notifies the caller with the parsed news or nil if there's an error.
    private func parseJSON(_ completion: @escaping (News?) -> Void) {
        if let url = Bundle.main.url(forResource: "News", withExtension: "json") {
            do {
                // try to read the contents of the file into a Data object.
                let data = try Data(contentsOf: url)
                
                // decode the Data object into a `News` object.
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(News.self, from: data)
                
                // notifying the caller with the parsed news data.
                completion(jsonData)
            } catch {
                // if there's an error (like the file not existing or being malformed),
                // log the error and notify the caller with nil.
                print("error while decoding the JSON data")
                completion(nil)
            }
        }
    }
}
