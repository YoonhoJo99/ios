//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 } // map이라는 operator
    .sink { value in
        print("Transformed value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter{ $0.contains("a") } // filter라는 operator
    .sink{ value in
        print("Filtered Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("bbb")
stringPublisher.send("sam")
stringPublisher.send("eee")
subscription2.cancel()



//: [Next](@next)
