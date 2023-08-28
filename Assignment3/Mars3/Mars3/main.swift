//
//  main.swift
//  Mars3
//
//  Created by Ronnie Kissos on 8/27/23.
//

import Foundation

enum Orientation: Character {
    case north = "N", east = "E", south = "S", west = "W"
}

struct Robot {
    var x: Int
    var y: Int
    var orientation: Orientation
}

struct Coordinate: Hashable {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func moveForward(_ robot: inout Robot) {
    switch robot.orientation {
    case .north:
        robot.y += 1
    case .east:
        robot.x += 1
    case .south:
        robot.y -= 1
    case .west:
        robot.x -= 1
    }
}

func rotateRight(_ orientation: Orientation) -> Orientation {
    switch orientation {
    case .north:
        return .east
    case .east:
        return .south
    case .south:
        return .west
    case .west:
        return .north
    }
}

func rotateLeft(_ orientation: Orientation) -> Orientation {
    switch orientation {
    case .north:
        return .west
    case .east:
        return .north
    case .south:
        return .east
    case .west:
        return .south
    }
}

func followInstructions(_ robot: inout Robot, instructions: String, scentSet: inout Set<Coordinate>, worldSize: (Int, Int)) {
    for instruction in instructions {
        switch instruction {
        case "F":
            let newX = robot.x
            let newY = robot.y
            moveForward(&robot)
            
            // Check if the move is valid within the world
            if newX < 0 || newY < 0 || newX > worldSize.0 || newY > worldSize.1 {
                let coordinate = Coordinate(x: robot.x, y: robot.y)
                
                if !scentSet.contains(coordinate) {
                    scentSet.insert(coordinate)
                    robot.x = newX
                    robot.y = newY
                    print("\(robot.x)\(robot.y)\(robot.orientation.rawValue)LOST")
                    return
                }
            }
        case "R":
            robot.orientation = rotateRight(robot.orientation)
        case "L":
            robot.orientation = rotateLeft(robot.orientation)
        default:
            break
        }
    }
    
    print("\(robot.x)\(robot.y)\(robot.orientation.rawValue)")
}

// Read the world size
if let worldInput = readLine(),
   let worldSize = worldInput.first,
   let width = Int(String(worldInput.prefix(1))),
   let height = Int(String(worldInput.suffix(1))) {
    
    let world = (width, height)
    
    // Process robot positions and instructions
    while let positionInput = readLine(),
        let instructions = readLine() {
        
        let positionComponents = positionInput.split(separator: " ")
        
        if positionComponents.count == 3,
            let x = Int(positionComponents[0]),
            let y = Int(positionComponents[1]),
            let orientationChar = positionComponents[2].first,
            let orientation = Orientation(rawValue: orientationChar) {
            
            var robot = Robot(x: x, y: y, orientation: orientation)
            var scentSet: Set<Coordinate> = []
            
            followInstructions(&robot, instructions: instructions, scentSet: &scentSet, worldSize: world)
        }
    }
}

// Read world size from user input
print("Enter the size of the world (format: 'width height'):")
if let worldInput = readLine(),
    let width = Int(worldInput.components(separatedBy: " ")[0]),
    let height = Int(worldInput.components(separatedBy: " ")[1]) {
    
    let worldSize = (width, height)
    
    // Read robot's initial position and orientation from user input
    print("Enter the robot's initial position and orientation (format: 'x y Orientation'):")
    if let positionInput = readLine(),
        let orientationChar = positionInput.components(separatedBy: " ").last?.first,
        let orientation = Orientation(rawValue: orientationChar),
        let x = Int(positionInput.components(separatedBy: " ")[0]),
        let y = Int(positionInput.components(separatedBy: " ")[1]) {
        
        var robot = Robot(x: x, y: y, orientation: orientation)
        var scentSet: Set<Coordinate> = []
        
        // Read robot instructions from user input
        print("Enter the robot's instructions:")
        if let instructions = readLine() {
            followInstructions(&robot, instructions: instructions, scentSet: &scentSet, worldSize: worldSize)
        } else {
            print("No instructions received")
        }
    } else {
        print("Invalid robot position input")
    }
} else {
    print("Invalid world size input")
}
