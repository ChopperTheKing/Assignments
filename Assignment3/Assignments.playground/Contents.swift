
//1 . Given an input array find 2nd maximum number from array

// Input  =  [1,2,4,6,7,8,9,10,3,4,6]
// output =  9

//var arr: Array = [1, 2, 4, 6, 7, 8, 9, 10, 3, 4, 6]
//var maxNum = 0
//var secondMaxNum = 0
//for num in arr {
//    if num >= maxNum {
//        secondMaxNum = maxNum
//        maxNum = num
//    }
//    else if num > secondMaxNum {
//        secondMaxNum = num
//    }
//}
//print(maxNum)
//print(secondMaxNum)



//2; given input array and and a target number , find the combination of 2 numbers whose sum is equal to target number


// input = [1,2,4,6, 0]  , Target Number = 5
// output = [1,4]

// 3. Coding Challange PDF

var arr: Array = [1, 2, 4, 6, 0]
var targetNum = 5
var num1 = arr[0]
var num2 = arr[0]

//for i in 0..<arr.count {
//    if (num1 + num2) == targetNum {
//        num1 = arr[num]
//        print(targetNum)
//    }
//    if (num1 + num2) == targetNum {
//        num2 = arr[num]
//        print(targetNum)
//    }
//}

for i in 0..<arr.count {
    num1 = arr[i]
    
    for j in i+1..<arr.count {
        num2 = arr[j]
        
        if num1 + num2 == targetNum {
            print("Combination with sum \(targetNum): [\(num1), \(num2)]")
            break
        }
    }
}

// num =
