//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator

struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, resposne in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())


// Notifications

let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription = notiPublisher.sink { _ in
    print("Noti Received")
}
center.post(name: noti, object: nil)

// KeyPath binding to NSObject instances



// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함


//: [Next](@next)
