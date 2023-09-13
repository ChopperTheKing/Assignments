//
//  NetworkManagerDelegate.swift
//  Countries
//
//  Created by Ronnie Kissos on 9/5/23.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func didFetchCountries(_ countries: [Country])
    func didFailWithError(_ error: Error)
}
