//
//  Product.swift
//  Assignment6
//
//  Created by Ronnie Kissos on 8/30/23.
//

//struct Product {
//    let name: String
//    let price: Double
//
//    init?(dictionary: [String: Any]) {
//        guard let name = dictionary["name"] as? String,
//              let price = dictionary["price"] as? Double else {
//            return nil
//        }
//
//        self.name = name
//        self.price = price
//    }
//}

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
}
