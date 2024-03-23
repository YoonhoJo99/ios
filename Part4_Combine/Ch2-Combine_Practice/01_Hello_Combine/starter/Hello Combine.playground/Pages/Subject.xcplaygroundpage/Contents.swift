import Foundation
import Combine

// PassthroughSubject - Subject (Publisher)
let relay = PassthroughSubject<String, Never>() // OutPut은 String, Failure은 Never

let subscription1 = relay.sink { value in // relay를 구독
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World")
//relay.send(1) // OutPut타입이 String이기 때문에 에러


// CurrentValueSubject - Subject (Publisher)
let variable = CurrentValueSubject<String, Never>("") // 필수로 초기값을 넣어줘야함

// variable.send("Initial text")

let subscription2 = variable.sink { value in // subscription이 생겼을 때 기존에 가지고 있던 데이터를 먼저 보냄
    print("subscription1 received value: \(value)")
}

variable.send("More text") //기존에 가지고 있던 데이터를 먼저 보내고
variable.value //현재 묻혀진 데이터


//
let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay) // publisher를 relay에 구독한다. publisher로부터 발행된 데이터가 relay를 통해 전달되면, 이를 subscription1이라는 Subscriber가 받아서 처리한다.
//publisher.subscribe(variable)

