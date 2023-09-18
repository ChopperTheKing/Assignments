//
//  DataFetching.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/17/23.
//

import Foundation

// Defines a protocol for any service that fetches data
protocol DataFetching {
    func fetchData(from urlString: String) async
}
