//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates : 중복된 데이터를 가려 받기
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates() // 중복되는 것을 제거
    .sink { value in
        print(value)
    }.store(in: &subscriptions) // 만든 subscription을 subscriptions에 들어가게됨

// compactMap

let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) } // 변환시켜 나온 아웃풋이 nil or float임, 이때 nil을 빼고 주는 게 compactMap
    .sink { value in
        print(value)
    }.store(in: &subscriptions) // 만든 subscription을 subscriptions에 들어가게됨


// ignoreOutput

let numbers = (1...10_000).publisher

numbers
    .ignoreOutput() // output을 무시
    .sink(receiveCompletion: { print("Completed with: \($0)")}, // receiveCompletion 아웃풋 다 받고 호출하는 부분
          receiveValue: { print($0)} ) // 각 output에 대한 부분
    .store(in: &subscriptions)

// prefix

let tens = (1...10).publisher

tens
    .prefix(2) // 앞에 2개의 데이터만 받겠다
    .sink(receiveCompletion: { print("Completed with: \($0)")},
          receiveValue: { print($0)} )
    .store(in: &subscriptions)


//: [Next](@next)
