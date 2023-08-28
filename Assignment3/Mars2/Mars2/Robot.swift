//
//  Robot.swift
//  Mars2
//
//  Created by Ronnie Kissos on 8/27/23.
//

import Foundation

enum Orientation: Character {
    case north = "N", east = "E", south = "S", west = "W"
}

class Robot {
    var x: Int
    var y: Int
    var orientation: Orientation
    
    init(x: Int, y: Int, orientation: Orientation) {
        self.x = x
        self.y = y
        self.orientation = orientation
    }
    
    func moveForward() {
        switch orientation {
        case .north:
            y += 1
        case .east:
            x += 1
        case .south:
            y -= 1
        case .west:
            x -= 1
        }
    }
    
    func turnRight() {
        switch orientation {
        case .north:
            orientation = .east
        case .east:
            orientation = .south
        case .south:
            orientation = .west
        case .west:
            orientation = .north
        }
    }
    
    func turnLeft() {
        switch orientation {
        case .north:
            orientation = .west
        case .west:
            orientation = .south
        case .south:
            orientation = .east
        case .east:
            orientation = .north
        }
    }
    
    func followInstructions(_ instructions: String) {
        for instruction in instructions {
            switch instruction {
            case "F":
                moveForward()
            case "R":
                turnRight()
            case "L":
                turnLeft()
            default:
                print("Invalid instruction: \(instruction)")
            }
        }
    }
}
