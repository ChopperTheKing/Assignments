import Foundation

enum Direction: String {
    case N, S, E, W
}

struct Position {
    var x: Int
    var y: Int
}

func move(_ position: inout Position, direction: Direction, maxX: Int, maxY: Int, lostPositions: inout Set<String>) -> Bool {
    let originalPosition = position
    switch direction {
    case .N:
        position.y += 1
    case .S:
        position.y -= 1
    case .E:
        position.x += 1
    case .W:
        position.x -= 1
    }
    
    if position.x < 0 || position.y < 0 || position.x > maxX || position.y > maxY {
        if !lostPositions.contains("\(originalPosition.x)\(originalPosition.y)") {
            lostPositions.insert("\(originalPosition.x)\(originalPosition.y)")
            position = originalPosition
            return true
        } else {
            position = originalPosition
        }
    }
    return false
}

func turn(_ direction: inout Direction, instruction: Character) {
    let directions: [Direction] = [.N, .E, .S, .W]
    if let index = directions.firstIndex(of: direction) {
        if instruction == "L" {
            direction = directions[(index - 1 + 4) % 4]
        } else {
            direction = directions[(index + 1) % 4]
        }
    }
}

func main() {
    print("Enter the upper-right coordinates of the rectangular world (e.g., 5 3):")
    guard let dimensionsInput = readLine(),
          let maxX = Int(dimensionsInput.split(separator: " ")[0]),
          let maxY = Int(dimensionsInput.split(separator: " ")[1]) else {
        print("Invalid input for dimensions.")
        return
    }

    var lostPositions: Set<String> = []

    while true {
        print("Enter the initial coordinates and orientation of the robot (e.g., 1 1 E):")
        guard let robotInput = readLine(),
              let posX = Int(robotInput.split(separator: " ")[0]),
              let posY = Int(robotInput.split(separator: " ")[1]),
              let dir = Direction(rawValue: String(robotInput.split(separator: " ")[2])) else {
            print("Invalid input for robot position or orientation.")
            return
        }

        var position = Position(x: posX, y: posY)
        var direction = dir

        print("Enter a sequence of robot instructions (L, R, F):")
        guard let instructions = readLine() else {
            print("Invalid input for instructions.")
            return
        }

        var isLost = false
        for instruction in instructions {
            if instruction == "F" {
                isLost = move(&position, direction: direction, maxX: maxX, maxY: maxY, lostPositions: &lostPositions)
                if isLost {
                    break
                }
            } else {
                turn(&direction, instruction: instruction)
            }
        }

        print("\(position.x) \(position.y) \(direction)\(isLost ? " LOST" : "")") // Modified line

        print("Would you like to continue? (yes/no)")
        if readLine()!.lowercased() == "no" {
            break
        }
    }
}


main()
