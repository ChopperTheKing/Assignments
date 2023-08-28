//
//  main.swift
//  Mars2
//
//  Created by Ronnie Kissos on 8/27/23.
//

import Foundation

struct World {
    var x: Int
    var y: Int
}

struct RobotPosition {
    var x: Int
    var y: Int
    var orientation: Orientation
}

print("What is the coordinates in the world? (x y)", terminator: " ")
let worldCoordinates = readLine()

if let input = readLine() {
    let coordinates = input.split(separator: " ")
    
    if coordinates.count == 2, let x = Int(coordinates[0]), let y = Int(coordinates[1]) {
        let world = World(x: x, y: y)
        let worldSize: [World] = [world]
        for world in worldSize {
            print("World's x coordinate: \(world.x)")
            print("World's y coordinate: \(world.y)")
        }
    } else {
        print("Invalid input format")
    }
} else {
    print("No input received")
}

print("What is the coordinates and orientation for the robot? (x y Orientation)", terminator: " ")

let positionInput = readLine()
if let positionInput = readLine() {
    let positionComponents = positionInput.split(separator: " ")
    
    if positionComponents.count == 3,
        let x = Int(positionComponents[0]),
        let y = Int(positionComponents[1]),
        let orientationChar = positionComponents[2].first,
        let orientation = Orientation(rawValue: orientationChar) {
        
        let robotPosition = RobotPosition(x: x, y: y, orientation: orientation)
        
        print("Enter the robot's instructions:")
        if let instructions = readLine() {
            let robotInstructions: [String] = [instructions]

            // Now you have a robotPosition and robotInstructions
            print("Robot's x coordinate: \(robotPosition.x)")
            print("Robot's y coordinate: \(robotPosition.y)")
            print("Robot's orientation: \(robotPosition.orientation)")
            print("Robot's instructions: \(robotInstructions)")
        } else {
            print("No instructions received")
        }
    } else {
        print("Invalid input format")
    }
} else {
    print("No input received")
}

let robot = Robot(x: 2, y: 3, orientation: .north)

print("Enter the robot's instructions:")
if let instructions = readLine() {
    robot.followInstructions(instructions)
    print("Robot's final position: x = \(robot.x), y = \(robot.y), orientation = \(robot.orientation.rawValue)")
} else {
    print("No instructions received")
}
//} else {
//    print("No instructions received")
//}
//print("write down instructions for robot1")
//let robot1Instructions = readLine()
//var robot = Robot(x: 0, y: 0, orientation: .north)
//print("Final position: x = \(robot.x), y = \(robot.y), orientation = \(robot.orientation.rawValue)")
//print("Where is robot2 located?")
//let robot2Located = readLine()
//print("write down instructions for robot2")
//let robot2Instructions = readLine()
//print("Where is robot3 located?")
//let robot3Located = readLine()
//print("write down instructions for robot3")
//let robot3Instructions = readLine()
//print("The first robot is locacted at ")
