import UIKit

// Due Date : 24/08

// Interview Questions (Theory)

// 1. how to create mutalbe and immutable types in Swift

// let [immutableVlue]: [type] = [value] to create constants
// var [immutableVlue]: [type] = [value] to create variables

// 2. what is Type Safety

// A type safe languages encourages you to be clear with the code you work with. For example, if you created an integer variable and assigned a number to it, you can't change its value to a string.

// 3. What is type Inference

// the automatic detection of the type of an expression in a formal language.

// 4. How to create explict and implict variables

// let [variableName]: [type] = [value] for explicit constants
// var [variableName]: [type] = [value] for explicit variables

// let [variableName] = [value] for implicit constants
// var [variableName] = [value] for implicit variables

// 5. What is Optionals

// An optional is a container for a value of a certain type

// 6. how to do optioanl binding

// let optionalCar: String? = "Sedan"
// if let car = optionalName {
// print("This is a " + car)
// } else {
// print("No " + car + " is available")
// }

// 7. Diff b/w if let and guard let

// Use if let when you want to conditionally execute code based on whether an optional value is nil or non-nil.
// Use guard let when you want to safely unwrap an optional value and continue with the rest of the scope if the value is non-nil, but exit the scope if the value is nil.

// 8 . What is nil coalsing operator

// It's an operator that's used to handle optionals by providing a defualt value in case the optional is nil

// 9. what is protocol

// a set of rules

// 10. What is class

// blueprint of an object

// 11. Diff b/w Struct and Class

// struct is a value type and classes are reference types.

// 12. Diff b/w array , dict  Set

// array: ordered collection of similar values
// dictionary: unordered collection of key-value pairs
// set: an unordered collection that doesn't allows duplicates

// Codign Questoins

//1 remvoe duplicate chars from a String
//     input : "aabbccdd" : output : abcd
//
// let input = "aabbccdd"
// let stringNoDuplicates = String(Set(input))
// print(stringNoDuplicates)

// 2. remove duplidate elemetn from an array
    
    // input : [1,2,2,3,4,7,5,5]
    // output = [1,2,3,4,7]

// let input = [1, 2, 2, 3, 4, 7, 5, 5]
// let arrayNoDuplicates = Array(Set(input))
// print(arrayNoDuplicates)
// 3. Create a class of Student with 4 attributes and 3 actions

// var name: String
// var age: Int
// var grade: String
// var studentID: String
//
// func study() {
//     print(name + " is studying hard for their exams.")
// }
//
// func takeExam() {
//     print(name + " is taking the exam for grade " + grade)
// }
//
// func displayInfo() {
//     print("Student Info:")
//     print("Name: \(name)")
//     print("Age: \(age)")
//     print("Grade: \(grade)")
//     print("Student ID: \(studentID)")
// }

// 4. create array of 10 students objects and iterate through array and print all each student name

// class Student {
//
//    var name: String
//    var age: Int
//    var grade: String
//    var studentID: String
//
//    init(name: String, age: Int, grade: String, studentID: String) {
//        self.name = name
//        self.age = age
//        self.grade = grade
//        self.studentID = studentID
//    }
// }
// var students: [Student] = []
//
// for i in 1...10 {
//     let student = Student(name: "Student \(i)", age: 18, grade: "12th", studentID: "\(i)")
//     students.append(student)
// }
//
// for i in students {
//    print(i.name)
// }


 //5. Create Optional variable and show use of optional binding.

// var optionalValue: Int? = 42
//
// if let unwrappedValue = optionalValue {
//     print("The value is \(unwrappedValue)")
// } else {
//     print("The value is nil")
// }


