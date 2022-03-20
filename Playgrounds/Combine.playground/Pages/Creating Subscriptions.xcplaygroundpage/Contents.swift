import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Subscriptions

//AnyCancellable is something you can call cancel on
var subscription: AnyCancellable? = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()
    
    .scan(0, { (count, _) in // Enters on each published value and modifies the value on receive
        return count + 1
    })
//    .throttle(for: .seconds(2), scheduler: DispatchQueue.main, latest: true) // limits the events that are passed on a time interval
    .filter({ count in // Enters on each published value and filters any value that passes through condition
        if !(count < 6) {  print("filtered value \(count)") }
        return count < 6
    })
    .sink { completion in
        print("data stream completion \(completion)")
    } receiveValue: { timestamp in
        print("recieve value: \(timestamp)")
    }

//Canceling subscription after 5 seconds
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    /// You can either cancel a subscription or deallocate it, if its an optional
//    subscription.cancel()
    subscription = nil
}
