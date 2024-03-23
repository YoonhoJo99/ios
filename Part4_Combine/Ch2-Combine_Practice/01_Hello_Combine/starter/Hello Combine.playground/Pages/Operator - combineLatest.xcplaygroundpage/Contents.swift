//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest : 두 퍼블리셔의 가장 최근 데이터를 보냄, 두 퍼블리셔 모두 보넀을 때만 데이터 전송

let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

//Publishers.CombineLatest(strPublisher, numPublisher)
//    .sink { (str, num) in
//    print("Receive: \(str), \(num)")
//}

strPublisher.combineLatest(numPublisher)
    .sink { (str, num) in
    print("Receive: \(str), \(num)")
}

strPublisher.send("a") // 전송 x
numPublisher.send(1) // "a", 1
strPublisher.send("b") // "b", 1
numPublisher.send(2) // "b", 2

// Advanced CombineLatest

let usernamePublsiher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendetialsSubscription = usernamePublsiher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }

usernamePublsiher.send("yoonho")
passwordPublisher.send("1234")
passwordPublisher.send("abcd1234abcd1234")

// Merge

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [10, 20, 30, 40, 50].publisher

//let mergePublisherSubscription = Publishers.Merge(publisher1, publisher2)
//    .sink { value in
//        print("Merge: subscirption recevied value: \(value)")
//    }

let mergePublisherSubscription = publisher1.merge(with: publisher2) // 두 퍼블리셔의 아웃풋 타입이 반드시 같아야 머지 가능. 여기서 publihser1 데이터를 먼저 보냄
    .sink { value in
        print("Merge: subscirption recevied value: \(value)")
    }

//: [Next](@next)
