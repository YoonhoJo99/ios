//: [Previous](@previous)

import Foundation
import Combine

let arrPublihser = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrPublihser
    .subscribe(on: queue)
    .map { value -> Int in // 헤비한 작업이라고 가정, 이 작업을 custom스레드에서 돌아가게 하고싶다.
        print("transform: \(value), thread: \(Thread.current)")
        return value + 1
    }
    .receive(on: DispatchQueue.main) // 
    .sink { value in
    print("Receive Value: \(value), thread: \(Thread.current)")
}



//: [Next](@next)
