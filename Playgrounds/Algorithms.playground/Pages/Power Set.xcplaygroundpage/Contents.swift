/**Given an integer array `nums` of **unique** elements, return *all possible subsets (the power set)*.
The solution set **must not** contain duplicate subsets. Return the solution in **any order**. **/

//Input: nums = [1,2,3]
//Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

//Input: nums = [0]
//Output: [[],[0]]

//Recursive tree
func powerSet(array: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    
    func recursiveSet(subset: [Int], index: Int) {
        var newSubset: [Int] = subset
        if index == array.count {
            result.append(subset)
        } else {
            recursiveSet(subset: newSubset, index: index+1)
            newSubset.append(array[index])
            recursiveSet(subset: newSubset, index: index+1)
        }
    }
    
    recursiveSet(subset: [], index: 0)
    
    return result
}

print("Recursive Tree \(powerSet(array: [1,2]))")

//Iterative
func powerSetIterative(array: [Int]) -> [[Int]] {
    var subsets: [[Int]] = [[]]
    var x : [Int:Int] = [:]
    for element in array { //n*2^n
        for subset in subsets {
            subsets.append(subset + [element])
        }
    }
    return subsets
}

print("Iterative \(powerSetIterative(array: [1,2]))")




