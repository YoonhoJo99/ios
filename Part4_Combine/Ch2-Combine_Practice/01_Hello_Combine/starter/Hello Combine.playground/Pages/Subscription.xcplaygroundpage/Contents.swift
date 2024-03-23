//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]") // 디버그용 메서드 (관계 형성, 데이터 받은 거, 컴플리션 불린 거 다 호출), "[Debug]" 붙이는 거 꿀팁
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")

subject.send(completion: .finished) // 관계를 끝내는 방법 1 : 이건 publisher가 끊은 거
//subscription.cancel() // 관계를 끝내는 방법 2 : 이건 subscriber가 끊은 거

subject.send("Hello ?? :(") // 위에서 관계를 끝내서 데이터를 받을 수 없음
//: [Next](@next)
