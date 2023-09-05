//
//  NetworkService.swift
//  Countries
//
//  Created by Ronnie Kissos on 9/5/23.
//

import Foundation

protocol NetworkService {
    func getCountries(completionHandler: @escaping ([Country]?, Error?) -> Void)
}
