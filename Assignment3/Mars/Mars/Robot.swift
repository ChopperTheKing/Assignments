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
        var nextX = x
        var nextY = y

        switch orientation {
        case .north:
            nextY += 1
        case .south:
            nextY -= 1
        case .east:
            nextX += 1
        case .west:
            nextX -= 1
        }

        // Check if the next position is within bounds
        if nextX >= 0 && nextX <= maxX && nextY >= 0 && nextY <= maxY {
            x = nextX
            y = nextY
        } else {
            // The robot goes off the grid, leave a scent
            scentSet.insert("\(x) \(y)")
        }
    }
    
    func turnLeft() {
        // Implement the left turn logic here
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
    
    func turnRight() {
        // Implement the right turn logic here
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
    
    func moveForward() {
        // Implement the right turn logic here
        switch orientation {
        case .north:
            y += 1
        case .south:
            y -= 1
        case .east:
            x += 1
        case .west:
            x -= 1
        }
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

