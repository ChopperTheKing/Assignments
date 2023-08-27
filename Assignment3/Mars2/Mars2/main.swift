//
//  main.swift
//  Mars2
//
//  Created by Ronnie Kissos on 8/27/23.
//

import Foundation

struct Robot {
    var x: Int
    var y: Int
    var orientation: Character
}

enum Orientation: Character {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

