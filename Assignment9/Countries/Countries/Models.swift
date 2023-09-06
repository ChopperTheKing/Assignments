//
//  Models.swift
//  Countries
//
//  Created by Ronnie Kissos on 9/6/23.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String
    let code: String
    let currency: Currency
    let region: String
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String?
}
