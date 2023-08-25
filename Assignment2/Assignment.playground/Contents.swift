import UIKit

// Due Date : 25/08

// Interview Questions (Theory)

// 1.  what is initilizers, use with example
    
// 2. what is protocol extension

// A protocol extension allows you to create default implementations for properties, methods, and other requirements defined in a protocol.

// 3. What is class extension

// A class extension allows you to create new functionalities, computed properties, methods, and more to an existing class without directly changing its code.

// 4. what is type alias

// A type alias allows you to provide an alternate name for an existing data type. It can be particularly helpful for making complex or long type names more readable and for making code more maintainable.

// 5. what is storybaords behind the scene

// Behind the scenes, storyboards are XML files that define the structure & layout of your app's screens or view controllers, their connections, transitions, and more.

// 6. what is closure

// A closure is a self-contained block of code that can be passed around and executed within your code.



// Codign Questoins

//1 create project which have  login Screen with userName , password fields and login button , it should work on iPhone and ipad and different Orientations

//2. Create project which have  Calculator Kind of UI with numbers and different operations

// 3. Create a closure to take firstName , lastName as param and return fullName






/*
    RUN THE CODE TO SEE MY ANSWERS :)
 */

// Due Date : 24/08

// Interview Questions (Theory)

// 1. How to create mutable and immutable types in Swift?
//  - You can create mutable types in swift by using the "var" keyword and immutable types by using the "let" keyword.

// 2. What is Type Safety?
//  - Type Safety means that once a variable is created as one type, it can not be changed or set to values of a different type. So if the variable is a String, you can not pass it an Int later.

// 3. What is they Inference
// 4. How to create explict and implict variables
// 5. What is Optionals
// 6. how to do optioanl binding
// 7. Diff b/w if let and guard let
// 8 . What is nil coalsing operator


// 9. what is protocol
// 10. What is class
// 11. Diff b/w Struct and Class

// 12. Diff b/w array , dict  Set

protocol QuestionProtocol {
    func printQuestion(index: Int)
    func answerQuestion()
}

class Question: QuestionProtocol {
    var question: String = ""
    var answer: String = ""
    
    init(question: String, answer: String) {
            self.question = question
            self.answer = answer
    }
    
    func printQuestion(index: Int) {
        print(index.formatted() + ". " + question)
    }
    
    func answerQuestion() {
        print("   - " + answer)
    }
}

class Questions {
    var questionsList: [Question] = [
        Question(
            question: "How to create mutable and immutable types in Swift?",
            answer: "You can create mutable types in swift by using the \"var\" keyword and immutable types by using the \"let\" keyword."
        ),
        Question(
            question: "What is Type Safety?",
            answer: "Type Safety means that once a variable is created as one type, it can not be changed or set to values of a different type. So if the variable is a String, you can not pass it an Int later."
        ),
        Question(
            question: "What is Type Inference?",
            answer: "Type Inference is the ability for the Swift compiler to identify what the type of the variable is automatically based on the value you provide. let x = 0 (will default to an Int)"
        ),
        Question(
            question: "How to create explicit and implicit variables?",
            answer: "You can create an implicit variable by using the var or let keyword and not specifying the type (var x = 0). You can create an explicit variable by using the var or let keyword and specify the type (let x:String = \"Cat\")."
        ),
        Question(
            question: "What is Optionals?",
            answer: "Optionals are variables that can be nil/null."
        ),
        Question(
            question: "How to do optional binding",
            answer: "You can do optional binding by using an \"if let\", \"guard let\", or \"nil coalescer\". \n" +
            "\n if let name = variableName {\n" +
            "    print(name)\n" +
            " }"  +
            "\n\n" +
            " guard let name = variableName else {\n" +
            "    return\n" +
            " }"
        ),
        Question(
            question: "Diff b/w if let and guard let",
            answer: "An \"if let\" is mainly used to unwrap an optional value if it exists. A \"guard let\" is used to exit the code early if the value does not exist. It tries to ensure that the value exists and if it doesn't it exits. It must utilize the \"return\" keyword to exit the code."
        ),
        Question(
            question: "What is nil coalescing operator",
            answer: "Nil coalescing unwraps the optional variable if it has a value, or it defaults to a value if it is nil. The \"??\" operator is used."
        ),
        Question(
            question: "What is a protocol?",
            answer: "A protocol serves as a blueprint of methods and properties for a class for example to abide by. The class must implement each property and method that the protocol defines."
        ),
        Question(
            question: "What is a class?",
            answer: "A class is a blueprint for an object. It consists of properties and methods."
        ),
        Question(
            question: "Diff b/w Struct and Class?",
            answer: "A Class is a reference type and a Struct is a value type. Classes are stored in Heap Memory and Structs are stored in Stack Memory."
        ),
        Question(
            question: "Diff b/w Array, Dict, and  Set?",
            answer: "Arrays are ordered and Dictionaries and Sets are not. A Set can not have duplicate values. Dictionaries utilize key value pairs while Arrays and Sets use indexes."
        )
    ]
    
    func printQuestionsandAnswers() {
        var i = 0
        for question in questionsList {
            i += 1
            question.printQuestion(index: i)
            question.answerQuestion()
            print("\n")
        }
    }
}


var questions:Questions = Questions()

questions.printQuestionsandAnswers()


// Coding Questions

//1. Remove duplicate chars from a String
    // input : "aabbccdd" : output : abcd

print("1. Remove duplicate chars from a String\n" +
      "input : \"aabbccdd\" : output : abcd")
print("\n")
var initialString = "aabbccdd"
var outputString = ""
var outputString2 = ""

for letter in initialString {   // O(n)
    if (!outputString.contains(letter)) {
        outputString += "\(letter)"
        outputString2.insert(letter, at: outputString2.endIndex)
    }
}

print(initialString)
print(outputString)
print(outputString2)
print("\n")

// 2. Remove duplicate element from an array
    
    // input : [1,2,2,3,4,7,5,5]
    // output = [1,2,3,4,7]

print("2. Remove duplicate element from an array\n" +
      "input : [1,2,2,3,4,7,5,5]\n" +
      "output: [1,2,3,4,7]")
print("\n")
var set: Set = [1,2,2,3,4,7,5,5]
var initialNums: [Int] = [1,2,2,3,4,7,5,5]
var outputNums: [Int] = []

print(set)

for num in initialNums {
    if (!outputNums.contains(num)) {
        outputNums.append(num)
    }
}

print(outputNums)
print("\n")

// 3. Create a class of Student with 4 attributes and 3 actions.

print("3. Create a class of Student with 4 attributes and 3 actions.")

class Student {
    var fName: String = ""
    var lName: String = ""
    var age: Int = 0
    var weight: Int = 0
    
    func printFName() {
        print(fName)
    }
    
    func printLName() {
        print(lName)
    }
    
    func printAge() {
        print(age)
    }
    
    func printWeight() {
        print(weight)
    }
}

print("\n")

// 4. Create array of 10 students objects and iterate through array and print all each student name.

print("4. Create array of 10 students objects and iterate through array and print all each student name.")

print("\n")

var students: [Student] = []
for i in 0 ... 9 {
    var student: Student = Student()
    student.fName = "Student " + (i + 1).formatted()
    students.append(student)
}

for stu in students {
    print("Name: " + stu.fName)
}

print("\n")

// 5. Create Optional variable and show use of optional binding.

print("5. Create Optional variable and show use of optional binding.")
print("\n")

var optionalVariable: String? = "This string printed because the optional variable was not nil."
if let optVariable = optionalVariable {
    print(optVariable)
}

optionalVariable = nil

if let optVariable = optionalVariable {
    print(optVariable)
}
