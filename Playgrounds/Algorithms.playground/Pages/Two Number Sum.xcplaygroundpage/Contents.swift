/**
 Given an array on `n` integers find two numbers that added return a target integer.

 Constraints:
 - Numbers are unique
 - There's always an answer
 3 < array < 10
 
 input: [2, 3, 4, 7, 9 ], target: 13
 output: [4, 9]

 input: [9, 3, 1, 5, 2, 6], target: 9
 output: [3, 6]
 
 */
//O(n^2)
func findTwoNumbers(inputArray: [Int], target: Int) -> [Int] {
    var result: [Int] = []
    for firstElement in inputArray {
        for secondElement in inputArray {
            if firstElement + secondElement == target {
                result.append(firstElement)
                result.append(secondElement)
                return result
            }
        }
    }
    return []
}

print("Iterative Brute Force \(findTwoNumbers(inputArray: [2, 3, 4, 7, 9 ], target: 13))")
print("Iterative Brute Force \(findTwoNumbers(inputArray: [9, 3, 1, 5, 2, 6], target: 9))")

//[2: 0] [3:1]
