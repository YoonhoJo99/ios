//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack" // @Published를 앞에 붙여, publisher로 만들어줌
    var age: Int = 20
}

final class Label { //UILabel 대신에 일단 씀
    var text: String = ""
}

// SomeViewModeld안에 있는 데이터를 Label의 text에 할당
let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)") // 구독 전

vm.$name.assign(to: \.text, on: label) // 구독, 구독할 때 $를 통한 published property 접근
print("text: \(label.text)") // 구독 후 출력

vm.name = "Jason" // 구독 후 변경해서 label.text가 업데이트
print("text: \(label.text)")

vm.name = "Hoo" // 구독 후 변경해서 label.text가 업데이트
print("text: \(label.text)")

//: [Next](@next)
