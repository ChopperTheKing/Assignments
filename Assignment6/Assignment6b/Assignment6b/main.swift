//
//  main.swift
//  Assignment6b
//
//  Created by Ronnie Kissos on 8/31/23.
//

import Foundation

enum ObjectCreationError: Error {
    case maxObjectsReached
}

class LimitedObject {
    static var objectCount = 0
    
    init() throws {
        if LimitedObject.objectCount >= 3 {
            throw ObjectCreationError.maxObjectsReached
        }
        
        LimitedObject.objectCount += 1
    }
}

do {
    
    let obj1 = try LimitedObject()
    let obj2 = try LimitedObject()
    let obj3 = try LimitedObject()
    
    print("Three objects created successfully")
    
    let obj4 = try LimitedObject()
    print("A fourth object was created")
} catch ObjectCreationError.maxObjectsReached {
    print("Error: The maximum number of objects was reached")
} catch {
    print("Unknown error occurred")
}
