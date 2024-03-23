//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
let just = Just(1000) //Just: 빌트인 Publisher(값을 다룸) : 데이터를 한 번 전송하면 끝이다.
let subscription1 = just.sink { value in //sink: 빌트인 Subscriber :Publisher가 제공한 데이터를 받을 수 있는 클로저 제공
    print("Received Value: \(value)")
}

let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscritpion2 = arrayPublisher.sink { value in
    print("Received Value \(value)")
}

class MyClass {
    var property: Int = 0 {
        didSet { // didSet : 속성이 변경된 직후 호출되는 property observer
            print("Did set  property to \(property)")
        }
    }
}

let object = MyClass()
let subscritpion3 = arrayPublisher.assign(to: \.property, on: object) // assign : Publisher가 제공한 데이터를 특정 객체의 키패스에 할당, 여기서는 object의 property인 property에 할당한다.
print("Final Value: \(object.property)")

//: [Next](@next)


