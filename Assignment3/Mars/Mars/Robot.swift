//
//  Robot.swift
//  Mars
//
//  Created by Ronnie Kissos on 8/27/23.
//

import Foundation

enum Orientation: Character {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

enum Instruction: Character {
    case left = "L"
    case right = "R"
    case forward = "F"
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
    
    func move(maxX: Int, maxY: Int, scentSet: inout Set<String>) {
        // Implement the movement logic here
    }
    
    func turnLeft() {
        // Implement the left turn logic here
    }
    
    func turnRight() {
        // Implement the right turn logic here
    }
    
    func executeInstructions(instructions: String, maxX: Int, maxY: Int, scentSet: inout Set<String>) {
            for instruction in instructions {
                switch instruction {
                case Instruction.left.rawValue:
                    turnLeft()
                case Instruction.right.rawValue:
                    turnRight()
                case Instruction.forward.rawValue:
                    move(maxX: maxX, maxY: maxY, scentSet: &scentSet)
                default:
                    break
                }
            }
        }
}

