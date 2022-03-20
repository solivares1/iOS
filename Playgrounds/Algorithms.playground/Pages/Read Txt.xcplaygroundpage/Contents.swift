//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func fileToString() -> String {
    
    let fileUrl = Bundle.main.url(forResource: "Input", withExtension: "txt")
    
    do {
        return try String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    } catch {
        return error.localizedDescription
    }
    
}

//print("File: \(fileToString())")

 func solution(_ S : inout String) -> Int {
    var dicionaryLetters : Dictionary<String, Int> = [:]
    for letter in S {
        if let value = dicionaryLetters[String(letter)] {
            dicionaryLetters[String(letter)] = value + 1
        } else {
            dicionaryLetters[String(letter)] = 1
        }
    }
    
    var unevenCount = 0
    for dictionary in dicionaryLetters {
        if dictionary.value % 2 != 0 {
            unevenCount = unevenCount + 1
        }
    }
    return unevenCount
}

var test1 = "acbcbba"
var s= test1.index
var sebas = test1.index(test1.startIndex, offsetBy: index)

print("\(solution(&test1))")
