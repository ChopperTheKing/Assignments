import UIKit



//

// 1 1  2  3  5  8  13  21  34 .....


// input : a gvien number from fibonicee series like 5
// size of fibnocie , starting gvien fib number = 4

// [5 , 8 , 13, 21]


//  input  8 ,  3
//  output = [8 , 13,  21 ]


// do this using higher order function


func fibonacci(of num: Int) -> Int {
    if num <= 1 { return num }
    
    var twoPrevious = 0
    var previous = 1
    var current = 1
    
    for _ in 2..<num {
        twoPrevious = previous
        previous = current
        current = twoPrevious + previous
    }
    
    return current
}

func generateFibonacciSequence(startingWith startNumber: Int, ofSize size: Int) -> [Int] {
    var index = 0
    
    // Find the starting index of the given number in the Fibonacci sequence
    while fibonacci(of: index) != startNumber {
        index += 1
    }
    
    // Using `map` to generate the sequence based on the given size
    return (index..<(index+size)).map(fibonacci)
}

print(generateFibonacciSequence(startingWith: 5, ofSize: 4))  // [5, 8, 13, 21]
print(generateFibonacciSequence(startingWith: 8, ofSize: 3))  // [8, 13, 21]


// 1. what is GCD
// 2. What is QOS
// 3. what is diff b/w main q and glboal q
// 4. Default queus provided by GCD
// 5. will you use global q or custom concurrent queue , which one and why

// 6. what is higher order functions , examples

// 7. Diff b/w map and compactmap
// 8 . what reduce does
// 9 . diff b/w sort and sorted



// Assignment during class

// add delete button in country cell and on click of that delete country from array and refresh tableView

 // Note : don't use swipe delete action.
