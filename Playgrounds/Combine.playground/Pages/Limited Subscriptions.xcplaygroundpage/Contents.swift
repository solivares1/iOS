//: [Previous](@previous)


// Subscriptions with limited publishers
import UIKit
import Combine


/// .publisher will create you a publisher
/// Sequence will pubish the items in the sequence of the array
/// Once the sequence finishes it will cancel itself
let foodBank: Publishers.Sequence<[String], Never> = ["apple", "bread", "orange","milk"].publisher

//let subscription = foodBank.sink { completion in
//    print("completion: \(completion)")
//} receiveValue: { foodItem in
//    print("foodItem: \(foodItem)")
//}

var timer = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()

// zip pairs up two publishers
let subscription = foodBank.zip(timer).sink { completion in
    print("completion: \(completion)")
} receiveValue: { (foodItem, timestamp) in
    print("foodItem: \(foodItem), timestamp: \(timestamp)")
}

//: [Next](@next)
